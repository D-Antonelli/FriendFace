//
//  ContentView.swift
//  FriendFace
//
//  Created by Derya Antonelli on 14/11/2022.
//

import SwiftUI
import Foundation


struct ContentView: View {
    @State private var friends = [Friend]()
    
    var body: some View {
        NavigationView {
            List(friends, id: \.self) { friend in
                LazyVStack(alignment: .leading) {
                    NavigationLink {
                        DetailView(friend: friend)
                    } label: {
                        VStack(alignment: .leading) {
                            Text("\(friend.name)")
                            friend.isActive ? Text("Active") : Text("Offline")
                        }
                    }
                }
            }
            .task {
                await loadData()
            }
            .navigationTitle("Friends")
            
        }
        
    }
    
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid url")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
            }
            
            
            if let decodedResponse = try? JSONDecoder().decode([Friend].self, from: data) {
                friends = decodedResponse
            } else {
                print("error decoding data")
            }
        } catch {
            print("error: \(error)")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
