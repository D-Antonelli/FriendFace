//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Derya Antonelli on 14/11/2022.
//

import SwiftUI

@main
struct FriendFaceApp: App {
    @StateObject private var dataController = DataController()
    @StateObject var users = UserMV()
    
    var body: some Scene {
        WindowGroup {
            ContentView(users: users)
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .onAppear(perform: users.fetch)
        }
    }
}


