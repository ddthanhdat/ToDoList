//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
	@Published var title: String = "123"
	@Published var dueDate: Date = Date()
	@Published var showAlert: Bool = false
		
	init() {}
	
	func save() {
		guard canSave else {
			return
		}
		
		//Get current userId
		guard let userId = Auth.auth().currentUser?.uid else {
			return
		}
		
		// create Model
		let newId = UUID().uuidString
		let newItem = ToDoListItemModel(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
		
		//save Model
		let db = Firestore.firestore()
		db.collection("users")
			.document(userId)
			.collection("todos")
			.document(newId)
			.setData(newItem.asDictionary())
		
	}
	
	
	var canSave: Bool {
		guard !title.isEmpty else {
			return false
		}
		
		guard dueDate >=  Date().addingTimeInterval(-86000) else {
			return false
		}
		
		return true
	}
}
