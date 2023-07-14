//
//  RegisterView.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import SwiftUI

struct RegisterView: View {
	@StateObject var viewModel = RegisterViewViewModel()

	
    var body: some View {
		VStack {
			// Header
			HeaderView(title: "To Do List", subtitle: "Register", backgroundColor: Color.orange, angel: -15.0)
			
			// body
			
			Form {
				
				if (!viewModel.errorMessage.isEmpty) {
					Text(viewModel.errorMessage)
						.foregroundColor(.red)
						.bold()
				}
				TextField("Fullname", text: $viewModel.fullname)
					.textFieldStyle(DefaultTextFieldStyle())
					.autocapitalization(.none)
					.autocorrectionDisabled()
				
				TextField("Email Address:", text: $viewModel.email)
					.textFieldStyle(DefaultTextFieldStyle())
					.autocapitalization(.none)
					.autocorrectionDisabled()

				SecureField("Password:", text: $viewModel.password)
					.textFieldStyle(DefaultTextFieldStyle())

				TLButton(title: "Create an account", background: .green) {
					viewModel.register()
				}
				.padding()
			}.offset(y: -50)
			Spacer()
		}
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
