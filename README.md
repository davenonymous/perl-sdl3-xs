# SDL3

Low-level Perl XS binding generated from the C headers by
`create-sdl3-bindings`. Do not edit the generated files; regenerate them.

## Building

    perl Makefile.PL   # needs `pkg-config --cflags --libs sdl3` to work
    make
    make test
    make install

## Layout

| Module | Header | Functions | Constants |
|--------|--------|----------:|----------:|
| `SDL3::API::Assert` | `SDL_assert.h` | 6 | 10 |
| `SDL3::API::Asyncio` | `SDL_asyncio.h` | 11 | 6 |
| `SDL3::API::Atomic` | `SDL_atomic.h` | 16 | 0 |
| `SDL3::API::Audio` | `SDL_audio.h` | 58 | 19 |
| `SDL3::API::Bits` | `SDL_bits.h` | 2 | 0 |
| `SDL3::API::Blendmode` | `SDL_blendmode.h` | 1 | 23 |
| `SDL3::API::Camera` | `SDL_camera.h` | 15 | 6 |
| `SDL3::API::Clipboard` | `SDL_clipboard.h` | 10 | 0 |
| `SDL3::API::Cpuinfo` | `SDL_cpuinfo.h` | 19 | 1 |
| `SDL3::API::Dialog` | `SDL_dialog.h` | 4 | 11 |
| `SDL3::API::Dlopennote` | `SDL_dlopennote.h` | 0 | 5 |
| `SDL3::API::Endian` | `SDL_endian.h` | 1 | 4 |
| `SDL3::API::Error` | `SDL_error.h` | 4 | 0 |
| `SDL3::API::Events` | `SDL_events.h` | 20 | 127 |
| `SDL3::API::Filesystem` | `SDL_filesystem.h` | 11 | 20 |
| `SDL3::API::Gamepad` | `SDL_gamepad.h` | 73 | 68 |
| `SDL3::API::Gpu` | `SDL_gpu.h` | 95 | 292 |
| `SDL3::API::Guid` | `SDL_guid.h` | 2 | 0 |
| `SDL3::API::Haptic` | `SDL_haptic.h` | 31 | 25 |
| `SDL3::API::Hidapi` | `SDL_hidapi.h` | 23 | 6 |
| `SDL3::API::Hints` | `SDL_hints.h` | 8 | 269 |
| `SDL3::API::Init` | `SDL_init.h` | 10 | 18 |
| `SDL3::API::Iostream` | `SDL_iostream.h` | 47 | 18 |
| `SDL3::API::Joystick` | `SDL_joystick.h` | 58 | 31 |
| `SDL3::API::Keyboard` | `SDL_keyboard.h` | 24 | 18 |
| `SDL3::API::Keycode` | `SDL_keycode.h` | 0 | 277 |
| `SDL3::API::Loadso` | `SDL_loadso.h` | 3 | 0 |
| `SDL3::API::Locale` | `SDL_locale.h` | 1 | 0 |
| `SDL3::API::Log` | `SDL_log.h` | 17 | 29 |
| `SDL3::API::Messagebox` | `SDL_messagebox.h` | 2 | 13 |
| `SDL3::API::Metal` | `SDL_metal.h` | 3 | 0 |
| `SDL3::API::Misc` | `SDL_misc.h` | 1 | 0 |
| `SDL3::API::Mouse` | `SDL_mouse.h` | 24 | 33 |
| `SDL3::API::Mutex` | `SDL_mutex.h` | 28 | 4 |
| `SDL3::API::Pen` | `SDL_pen.h` | 1 | 22 |
| `SDL3::API::Pixels` | `SDL_pixels.h` | 11 | 189 |
| `SDL3::API::Platform` | `SDL_platform.h` | 1 | 0 |
| `SDL3::API::PlatformDefines` | `SDL_platform_defines.h` | 0 | 2 |
| `SDL3::API::Power` | `SDL_power.h` | 1 | 6 |
| `SDL3::API::Process` | `SDL_process.h` | 9 | 21 |
| `SDL3::API::Properties` | `SDL_properties.h` | 20 | 7 |
| `SDL3::API::Rect` | `SDL_rect.h` | 18 | 0 |
| `SDL3::API::Render` | `SDL_render.h` | 102 | 116 |
| `SDL3::API::Scancode` | `SDL_scancode.h` | 0 | 250 |
| `SDL3::API::Sensor` | `SDL_sensor.h` | 14 | 10 |
| `SDL3::API::Storage` | `SDL_storage.h` | 17 | 0 |
| `SDL3::API::Surface` | `SDL_surface.h` | 65 | 18 |
| `SDL3::API::System` | `SDL_system.h` | 11 | 5 |
| `SDL3::API::Thread` | `SDL_thread.h` | 9 | 12 |
| `SDL3::API::Time` | `SDL_time.h` | 9 | 5 |
| `SDL3::API::Timer` | `SDL_timer.h` | 10 | 5 |
| `SDL3::API::Touch` | `SDL_touch.h` | 4 | 6 |
| `SDL3::API::Tray` | `SDL_tray.h` | 23 | 5 |
| `SDL3::API::Version` | `SDL_version.h` | 2 | 4 |
| `SDL3::API::Video` | `SDL_video.h` | 113 | 178 |


Struct and union classes live directly below `SDL3::`, see
`SDL3::Struct` for the object model and `SDL3::Pointer` for untyped
memory. `bindgen-report.txt` lists every declaration that was left out and why.

## Conventions

See `perldoc SDL3` for how strings, structs, out parameters,
callbacks and variadic functions are mapped.
