//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject{
	@Published var fullname = ""
	@Published var email = ""
	@Published var password = ""
	@Published var errorMessage = ""
	
	init() {}
	
	func register() {
		guard validate() else {
			return
		}
		
		Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
			guard let userId = result?.user.uid else {
				return
			}

			self?.insertUserRecord(id: userId)
		}
	}

	private func insertUserRecord(id: String) {
		let newUser = UserModel(id: id,
						   name: fullname,
						   email: email,
						   joined: Date().timeIntervalSince1970)

		let db = Firestore.firestore()

		db.collection("users")
			.document("id")
			.setData(newUser.asDictionary())
	}

	private func validate() -> Bool{
		guard !fullname.trimmingCharacters(in: .whitespaces).isEmpty,
				!email.trimmingCharacters(in: .whitespaces).isEmpty,
				!password.trimmingCharacters(in: .whitespaces).isEmpty
		else {
			errorMessage = "Please fill in all fields."
			return false
		}

		//email @ .com
//		guard !email.contains("@") else {
//			errorMessage = "Please enter valid email."
//			return false
//		}

		return true
	}
}
