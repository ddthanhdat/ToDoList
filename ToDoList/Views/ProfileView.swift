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
				Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
			}.navigationTitle("Profile")
		}
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
