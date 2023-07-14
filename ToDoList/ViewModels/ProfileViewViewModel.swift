//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
	@Published var user: UserModel? = nil
	
	init () {
		
	}
	
	func logout() {
		do {
			try Auth.auth().signOut()
		} catch let error {
			// handle error here
			print("Error trying to sign out of Firebase: \(error.localizedDescription)")
		}
	}
	
	
	func fetchUser() {
		guard let userId = Auth.auth().currentUser?.uid else {
			return
		}
		let db = Firestore.firestore()
		db.collection("users").document(userId).getDocument(completion: { [weak self] snapshot, error in
			guard let data = snapshot?.data(), error == nil else {
				return
			}
			
			DispatchQueue.main.async {
				self?.user = UserModel(
					id: data["id"] as? String ?? "",
					name: data["name"] as? String ?? "",
					email: data["email"] as? String ?? "",
					joined: data["joined"] as? TimeInterval ?? 0
				)
			}
		})
	}
}
