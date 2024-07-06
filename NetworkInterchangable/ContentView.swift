//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by Furkan İSLAM on 6.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    init() {
        self.userListViewModel = UserListViewModel(service: Localservice())
    }
    
    var body: some View {
        List(userListViewModel.userList, id: \.id) { user in
            VStack {
                Text(user.name)
                    .font(.title3)
                    .foregroundStyle(Color(.blue))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.username)
                    .foregroundStyle(Color(.green))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.email)
                    .foregroundStyle(Color(.black))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.task {
           await userListViewModel.downloadUsers()
        }
    }
}

#Preview {
    ContentView()
}
