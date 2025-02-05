set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

extra_flags := if os() == "windows" {
    "-lgdi32 -lwinmm"
} else { "" }

cxx := 'g++'
bin := './bin/rpg'

cflags := `cat compile_flags.txt`

alias b := build
alias r := run

build:
    {{cxx}} ./src/main.cc -o {{bin}} {{cflags}} {{extra_flags}}

run:
    {{bin}}

prepare:
    git clone --depth=1 https://github.com/raysan5/raylib
    git clone --depth=1 https://github.com/raysan5/raygui
    git clone --depth=1 https://github.com/raylib-extras/rlImGui
    git clone --depth=1 https://github.com/ocornut/imgui
    
    make -C raylib/src/

    cd imgui
    {{cxx}} -c ./*.cpp
    ar rcs libimgui.a ./*.o
    cd ..