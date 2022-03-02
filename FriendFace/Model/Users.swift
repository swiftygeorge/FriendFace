//
//  Users.swift
//  FriendFace
//
//  Created by George Mapaya on 2022-03-01.
//

import Foundation

final class Users: ObservableObject {
    @Published var profiles = [User]()
    
    func fetchData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            fatalError("Invalid url")
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let decodedProfiles = try decoder.decode(Array<User>.self, from: data)
            
            DispatchQueue.main.async {
                self.profiles = decodedProfiles
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
