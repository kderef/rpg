#include <cstdio>
#include <imgui.h>
#include <rlImGui.cpp>
#include <raylib.h>


int main() {
    printf("Hello\n");

    InitWindow(800, 600, "RPG");

    // before your game loop
    rlImGuiSetup(true); 	// sets up ImGui with ether a dark or light default theme


    while (!WindowShouldClose()) {

        BeginDrawing();
        ClearBackground(BLACK);
        // inside your game loop, between BeginDrawing() and EndDrawing()
        rlImGuiBegin();			// starts the ImGui content mode. Make all ImGui calls after this
        bool open = true;
		ImGui::ShowDemoWindow(&open);

        rlImGuiEnd();			// ends the ImGui content mode. Make all ImGui calls before this
        EndDrawing();
    }

    // after your game loop is over, before you close the window

    rlImGuiShutdown();		// cleans up ImGui
    return 0;
}