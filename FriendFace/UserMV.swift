//
//  Users.swift
//  FriendFace
//
//  Created by Derya Antonelli on 21/11/2022.
//

import Foundation

class UserMV: ObservableObject {
    @Published var users = [User]()
    
    func fetch() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
    
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print(error.localizedDescription)
                } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    print("Bad response: \(response.statusCode)")
                } else if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                        self.users = decodedResponse
                    } else {
                        print("Error decoding data")
                    }
                }
            }

        }
        
        task.resume()

    }
}
