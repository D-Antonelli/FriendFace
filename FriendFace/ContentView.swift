//
//  ContentView.swift
//  FriendFace
//
//  Created by Derya Antonelli on 14/11/2022.
//

import SwiftUI
import Foundation


struct ContentView: View {
    @StateObject var users = UserMV()
    
    var body: some View {
        NavigationView {
            List(users.users, id: \.self) { user in
                LazyVStack(alignment: .leading) {
                    NavigationLink {
                        DetailView(user: user)
                    } label: {
                        VStack(alignment: .leading) {
                            Text("\(user.name)")
                            user.isActive ? Text("Active") : Text("Offline")
                        }
                    }
                }
            }
            .navigationTitle("Friends")
            .onAppear(perform: users.fetch)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
