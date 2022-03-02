//
//  UserDetailRow.swift
//  FriendFace
//
//  Created by George Mapaya on 2022-03-02.
//

import SwiftUI

struct UserDetailRow: View {
    let title: String
    let text: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("\(title): ")
                .foregroundColor(.secondary)
                .fontWeight(.light)
            
            Spacer(minLength: 20)
            
            Text(text)
                .multilineTextAlignment(.trailing)
        }
        .font(.body)
    }
}

struct UserDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailRow(title: "Age", text: "29")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
