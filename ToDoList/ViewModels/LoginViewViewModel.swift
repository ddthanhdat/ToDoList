//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import Foundation
import FirebaseAuth


class LoginViewViewModel: ObservableObject {
	@Published var email = ""
	@Published var password = ""
	@Published var errorMessage = ""
	
	init() {
		
	}
	
	func login() {
		guard validate() else {
			return
		}

//		Try login
		Auth.auth().signIn(withEmail: email, password: password)
	}
	
	func debug() {
		email = "ddthanhdat2@gmail.com"
		password = "123123"
	}

	private func validate() -> Bool {
		guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
			errorMessage = "Please fill in all fields."
			return false
		}

		//email @ .com
//		guard !email.contains("@") && !email.contains(".") else {
//			errorMessage = "Please enter valid email."
//			return false
//		}

		return true
	}
}
