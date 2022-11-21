//
//  ContentView.swift
//  FriendFace
//
//  Created by Derya Antonelli on 14/11/2022.
//

import SwiftUI
import Foundation


struct ContentView: View {
    @ObservedObject var users: UserMV
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cachedData: FetchedResults<CachedUser>

    
    var body: some View {
        NavigationView {
            List(cachedData, id: \.self) { data in
                LazyVStack(alignment: .leading) {
                    NavigationLink {
                        DetailView(user: data)
                    } label: {
                        VStack(alignment: .leading) {
                            Text("\(data.wrappedName)")
                            data.isActive ? Text("Active") : Text("Offline")
                        }
                    }
                }
            }
            .navigationTitle("Friends")
            .task {
                await MainActor.run {
                    cacheData()
                }
            }
        }
    }
    
    func cacheData() {
        for user in users.users {
            let newUser = CachedUser(context: moc)
            newUser.name = user.name
            newUser.id = user.id

            let friend = CachedFriend(context: moc)
            friend.name = user.friends[0].name
            friend.id = user.friends[0].id

            friend.origin = newUser

            try? moc.save()
        }

    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(users: UserMV())
    }
}
