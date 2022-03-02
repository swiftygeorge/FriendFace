//
//  UserDetailView.swift
//  FriendFace
//
//  Created by George Mapaya on 2022-03-02.
//

import SwiftUI

struct UserDetailView: View {
    @ObservedObject var users: Users
    
    let user: User
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 30) {
                profilePicture
                userInfo
                about
                friends
                misc
            }
            .padding()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                username
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                if user.isActive {
                    Button(action: {}) {
                        Label("Video call", systemImage: "phone.fill")
                    }
                }
            }
        }
    }
    
    var username: some View {
        HStack {
            Text(user.name)
                .font(.headline)
                .layoutPriority(1)
            
            Image(systemName: "circle.fill")
                .font(.system(size: 8))
                .foregroundColor(user.isActive ? .green : .gray)
        }
    }
    
    var profilePicture: some View {
        HStack {
            Spacer()
            
            Image("user")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .strokeBorder(.purple, lineWidth: 4)
                }
            
            Spacer()
        }
    }
    
    var userInfo: some View {
        VStack(alignment: .leading, spacing: 10) {
            UserDetailRow(title: "Age", text: String(user.age))
            UserDetailRow(title: "Company", text: user.company)
            UserDetailRow(title: "Email", text: user.email)
            UserDetailRow(title: "Address", text: user.address)
        }
        .padding(10)
        .background(.ultraThickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 1)
        .padding(.horizontal)
    }
    
    var about: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("About")
                .font(.headline)
            divider
            Text(user.about)
            divider
        }
    }
    
    var friends: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Friends")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 15) {
                    ForEach(user.friends) { friend in
                        NavigationLink {
                            if let user = users.profiles.first(where: { $0.id == friend.id }) {
                                UserDetailView(users: users, user: user)
                            } else {
                                Text("This user's profile cannot be viewed because it is private.")
                            }
                        } label: {
                            FriendView(friend: friend)
                        }
                        
                    }
                }
            }
        }
    }
    
    var misc: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Misc.")
                .font(.headline)
            
            VStack(alignment: .leading) {
                Text("Joined: \(user.joined.formatted(date: .abbreviated, time: .omitted))")
                Text("Tags: \(user.tags.joined(separator: ", "))")
                    .font(.system(size: 10))
            }
            .font(.footnote)
            .foregroundColor(.secondary)
        }
    }
    
    var divider: some View {
        Rectangle()
            .foregroundColor(.purple)
            .frame(height: 2)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailView(users: Users(), user: exampleUser)
        }
    }
}
