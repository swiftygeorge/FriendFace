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
                Text("online")
                    .foregroundColor(.secondary)
                    .font(.system(size: 10))
                
                Image(systemName: "circle")
                    .symbolVariant(.fill)
                    .foregroundColor(.green)
                    .font(.system(size: 8))
            }
        }
    }
}

struct UserListRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserListRowView(user: exampleUser)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
