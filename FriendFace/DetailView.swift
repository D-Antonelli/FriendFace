//
//  DetailView.swift
//  FriendFace
//
//  Created by Derya Antonelli on 14/11/2022.
//

import SwiftUI

struct DetailView: View {
    let friend: Friend
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                VStack(alignment: .center, spacing: 16) {
                    
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 120))
                        .foregroundColor(.accentColor)
                    
                    Text("\(friend.name)")
                        .font(.largeTitle)
                        .bold()
                    
                    VStack(alignment: .center) {
                        Text("\(friend.about)")
                        
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "building.2.fill")
                        Text("Works at \(friend.company)")
                    }
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "mail.fill")
                        Text("\(friend.email)")
                    }
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "house.fill")
                        Text("\(friend.address)")
                    }
                }
                Divider()
                VStack(alignment: .leading, spacing: 16) {
                    Text("Friends")
                        .font(.title)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            
                            
                            ForEach(friend.friends, id: \.self) { person in
                                VStack {
                                    Image(systemName: "person.circle")
                                        .font(.largeTitle)
                                        .foregroundColor(.accentColor)
                                    Text("\(person.name)")
                                    
                                }
                                
                            }
                            
                        }
                    }
                }
                
                
            }
            .padding()
            
            
        }
    }
    
    
    
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
