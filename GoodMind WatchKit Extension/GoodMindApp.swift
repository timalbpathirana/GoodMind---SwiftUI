//
//  GoodMindApp.swift
//  GoodMind WatchKit Extension
//
//  Created by Timal Pathirana on 19/6/2022.
//

import SwiftUI

@main
struct GoodMindApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
