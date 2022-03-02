//
//  UserListRowView.swift
//  FriendFace
//
//  Created by George Mapaya on 2022-03-01.
//

import SwiftUI

struct UserListRowView: View {
    let user: User
    
    var body: some View {
        HStack(alignment: .center) {
            Text(user.name)
                .font(.headline)

            Spacer()
            
            if user.isActive {
                Text("Online")
                    .foregroundColor(.secondary)
                    .font(.caption)
                
                Image(systemName: "circle")
                    .symbolVariant(.fill)
                    .foregroundColor(.green)
                    .font(.caption)
            }
        }
    }
}

struct UserListRowView_Previews: PreviewProvider {
    static var user = User(id: "", isActive: true, name: "John Doe", age: 25, company: "", email: "", address: "", about: "", registered: "", tags: [], friends: [])
    
    static var previews: some View {
        UserListRowView(user: user)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
