//
//  ContentView.swift
//  FriendFace
//
//  Created by George Mapaya on 2022-03-01.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var users = Users()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users.profiles) { user in
                    NavigationLink {
                        UserDetailView(users: users, user: user)
                    } label: {
                        UserListRowView(user: user)
                    }
                }
            }
            .navigationTitle("FriendFace")
        }
        .onAppear {
            if users.profiles.isEmpty {
                Task {
                    await users.fetchData()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
