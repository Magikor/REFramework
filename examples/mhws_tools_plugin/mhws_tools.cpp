#include <Windows.h>
#include <shellapi.h>

#include <filesystem>
#include <string>
#include <vector>

#include <reframework/API.hpp>
#include <sol/sol.hpp>

using namespace reframework;

static std::wstring to_wstring(const std::string& s) {
    if (s.empty()) {
        return {};
    }

    const int needed = MultiByteToWideChar(CP_UTF8, 0, s.c_str(), (int)s.size(), nullptr, 0);
    if (needed <= 0) {
        return {};
    }

    std::wstring out;
    out.resize((size_t)needed);
    MultiByteToWideChar(CP_UTF8, 0, s.c_str(), (int)s.size(), out.data(), needed);
    return out;
}

static std::string to_utf8_string(const std::filesystem::path& p) {
    const auto u8 = p.u8string();
    std::string out;
    out.reserve(u8.size());
    for (const char8_t c : u8) {
        out.push_back(static_cast<char>(c));
    }
    return out;
}

static std::filesystem::path get_game_root() {
    wchar_t exePath[MAX_PATH]{};
    GetModuleFileNameW(nullptr, exePath, MAX_PATH);
    std::filesystem::path p{exePath};
    return p.parent_path();
}

static std::filesystem::path first_existing_rel(const std::vector<std::filesystem::path>& candidates) {
    const auto root = get_game_root();
    for (auto const& rel : candidates) {
        const auto abs = root / rel;
        std::error_code ec{};
        if (std::filesystem::exists(abs, ec) && !ec) {
            return abs;
        }
    }

    return {};
}

static sol::object make_result(sol::this_state s, bool ok, const std::string& detail) {
    sol::state_view lua{s};
    sol::table t = lua.create_table();
    t["ok"] = ok;
    t["detail"] = detail;
    return sol::make_object(lua, t);
}

static sol::object launch_path(sol::this_state s, const std::filesystem::path& absPath) {
    if (absPath.empty()) {
        return make_result(s, false, "not found");
    }

    const auto verb = L"open";
    const auto file = absPath.wstring();

    const HINSTANCE h = ShellExecuteW(nullptr, verb, file.c_str(), nullptr, nullptr, SW_SHOWNORMAL);
    const auto code = reinterpret_cast<INT_PTR>(h);

    if (code <= 32) {
        return make_result(s, false, "ShellExecute failed (code " + std::to_string((int)code) + ")");
    }

    return make_result(s, true, to_utf8_string(absPath));
}

static void on_lua_state_created(lua_State* L) {
    API::LuaLock _{};

    sol::state_view lua{L};

    sol::table tools = lua.create_table();

    tools.set_function("launch_mhws_editor", [](sol::this_state s) {
        const auto abs = first_existing_rel({
            std::filesystem::path{"MHWS-Editor.exe"},
            std::filesystem::path{"MHWS-Editor\\MHWS-Editor.exe"},
            std::filesystem::path{"RE-Editor\\MHWS-Editor.exe"},
        });
        return launch_path(s, abs);
    });

    tools.set_function("launch_re_editor", [](sol::this_state s) {
        const auto abs = first_existing_rel({
            std::filesystem::path{"RE-Editor\\RE-Editor.exe"},
            std::filesystem::path{"RE-Editor.exe"},
        });
        return launch_path(s, abs);
    });

    tools.set_function("open_path", [](sol::this_state s, const std::string& relativeOrAbsolute) {
        std::filesystem::path p = std::filesystem::path{to_wstring(relativeOrAbsolute)};

        // If it's relative, resolve against game root.
        if (!p.empty() && !p.is_absolute()) {
            p = get_game_root() / p;
        }

        std::error_code ec{};
        if (p.empty() || !std::filesystem::exists(p, ec) || ec) {
            return make_result(s, false, "not found");
        }

        return launch_path(s, p);
    });

    // Expose as global table.
    lua["mhws_tools"] = tools;
}

extern "C" __declspec(dllexport) void reframework_plugin_required_version(REFrameworkPluginVersion* version) {
    version->major = REFRAMEWORK_PLUGIN_VERSION_MAJOR;
    version->minor = REFRAMEWORK_PLUGIN_VERSION_MINOR;
    version->patch = REFRAMEWORK_PLUGIN_VERSION_PATCH;
}

extern "C" __declspec(dllexport) bool reframework_plugin_initialize(const REFrameworkPluginInitializeParam* param) {
    API::initialize(param);

    const auto functions = param->functions;
    functions->on_lua_state_created(on_lua_state_created);

    functions->log_info("mhws_tools_plugin loaded");
    return true;
}
