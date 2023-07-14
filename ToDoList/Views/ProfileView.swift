//
//  ProfileView.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import SwiftUI

struct ProfileView: View {
	
	@StateObject var viewModel = ProfileViewViewModel()
	
	init() {
		
	}
	
	
    var body: some View {
		NavigationView {
			VStack {
				if let user = viewModel.user {
					//Avatar image
					Image(systemName: "person.circle")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.foregroundColor(.blue)
						.frame(width: 125, height: 125)
					
					// Info: Name, Email, Number sice
					VStack(spacing: 20) {
						HStack {
							Text("Name: ")
							Text(user.name)
						}
						HStack {
							Text("Email: ")
							Text(user.email)
						}
						HStack {
							Text("Member Since: ")
							Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
						}
					}.padding(.top, 20)
					// Sign out
					Button("Log Out") {
						viewModel.logout()
					}.padding()
				} else {
					Text("Loading Profile")
					Button("Log Out") {
						viewModel.logout()
					}.padding()
				}
				Spacer()
			}.navigationTitle("Profile")
		}.onAppear() {
			viewModel.fetchUser()
		   }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
