//
//  ContentView.swift
//  FriendFace
//
//  Created by Derya Antonelli on 14/11/2022.
//

import SwiftUI

struct Friend: Codable, Hashable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int16
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let Friends: [Person]
}

struct Person: Codable, Hashable {
    let id: String
    let name: String
}

struct ContentView: View {
    @State private var friends = [Friend]()
    
    var body: some View {
        NavigationView {
            List(friends, id: \.self) { friend in
                        LazyVStack {
                            Text("\(friend.name)")
                        }
                    }
                    .task {
                        await loadData()
                        // data - error - loading
                    }
            .navigationTitle("Friends")
            
            
        }
        
    }
    
    
    func loadData() async {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            
            if let decodedResponse = try? JSONDecoder().decode([Friend].self, from: data) {
                friends = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
