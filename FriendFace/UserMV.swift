//
//  Users.swift
//  FriendFace
//
//  Created by Derya Antonelli on 21/11/2022.
//

import Foundation

class UserMV: ObservableObject {
    @Published var users = [User]()
    @Published var errorMessage: String? = nil
    
    func fetch() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            errorMessage = "Invalid URL"
            return
        }
        
    
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    self.errorMessage = "Bad response: \(response.statusCode)"
                } else if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                        self.users = decodedResponse
                    } else {
                        self.errorMessage = "Error decoding data"
                    }
                }
            }

        }
        
        task.resume()
    }
}
