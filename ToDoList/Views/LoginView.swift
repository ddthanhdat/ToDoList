//
//  LoginView.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import SwiftUI

struct LoginView: View {
	@StateObject var viewModel = LoginViewViewModel()
	
    var body: some View {
		NavigationView {
			VStack {
				// Header
				HeaderView(title: "To Do List", subtitle: "Login")
				// body
				
				
				Form {
					if !viewModel.errorMessage.isEmpty {
						Text(viewModel.errorMessage)
							.foregroundColor(.red)
					}
					
					TextField("Email Address:", text: $viewModel.email)
						.textFieldStyle(DefaultTextFieldStyle())
						.autocorrectionDisabled()
						.autocapitalization(.none)
					
					SecureField("Password:", text: $viewModel.password)
						.textFieldStyle(DefaultTextFieldStyle())
						.autocorrectionDisabled()
						.autocapitalization(.none)
					
					
					TLButton(title: "Login") {
						viewModel.login()
					}.padding()
				}
				.offset(y: -50)
				
				VStack {
					Text("New Aaround here?")
			
					// show registraction
					NavigationLink("Create an account") {
						RegisterView()
					}
				}
				.padding(.bottom, 50)
				Spacer()
			}
		}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
