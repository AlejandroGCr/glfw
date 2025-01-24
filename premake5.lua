project "GLFW"
kind "StaticLib"
language "C"
staticruntime "off"
warnings "off"

files
{
    "include/GLFW/glfw3.h",
    "include/GLFW/glfw3native.h",
    "src/glfw_config.h",
    "src/context.c",
    "src/init.c",
    "src/input.c",
    "src/monitor.c",

    "src/null_init.c",
    "src/null_joystick.c",
    "src/null_monitor.c",
    "src/null_window.c",

    "src/platform.c",
    "src/vulkan.c",
    "src/window.c",

    "src/win32_init.c",
    "src/win32_joystick.c",
    "src/win32_module.c",
    "src/win32_monitor.c",
    "src/win32_time.c",
    "src/win32_thread.c",
    "src/win32_window.c",
    "src/wgl_context.c",
    "src/egl_context.c",
    "src/osmesa_context.c"
}

targetdir "Binaries/%{cfg.buildcfg}"
objdir "Intermediate/%{cfg.buildcfg}"

includedirs { "include/GLFW", "src/" }
defines {
    "WIN32",
    "_WINDOWS",
    "_GLFW_WIN32",
    "UNICODE",
    "_UNICODE",
    "_CRT_SECURE_NO_WARNINGS"
}

filter "configurations:Release"
    defines { "NDEBUG" }
    optimize "speed"
    runtime "Release"

filter "configurations:Debug"
    symbols "on"
    runtime "Debug"

filter "configurations:Dist"
    defines { "NDEBUG" }
    optimize "speed"
    runtime "Release"
    symbols "off"