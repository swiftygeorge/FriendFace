//
//  FriendView.swift
//  FriendFace
//
//  Created by George Mapaya on 2022-03-02.
//

import SwiftUI

struct FriendView: View {
    let friend: Friend
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Image("account")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
            
            Text(friend.name)
                .font(.caption)
                .foregroundColor(.secondary)
                .truncationMode(.tail)
        }
        .frame(maxWidth: 80)
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView(friend: exampleUser.friends[0])
    }
}
