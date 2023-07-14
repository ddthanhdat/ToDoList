//
//  UpdateItemViewViewModel.swift
//  ToDoList
//
//  Created by thanhdat on 13/07/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UpdateItemViewViewModel: ObservableObject {
	@Published var title: String = "123"
	@Published var dueDate: Date = Date()
	@Published var showAlert: Bool = false
	private var item: ToDoListItemModel
		
	init(item: ToDoListItemModel) {
		self.title = item.title
		self.item = item
	}
	
	func save() {
		guard canSave else {
			return
		}
		
		//Get current userId
		guard let userId = Auth.auth().currentUser?.uid else {
			return
		}
		
		// create Model
		let newItem = ToDoListItemModel(
			id: item.id,
			title: title,
			dueDate: dueDate.timeIntervalSince1970,
			createdDate: Date().timeIntervalSince1970,
			isDone: false
		)
		
		//save Model
		let db = Firestore.firestore()
		db.collection("users")
			.document(userId)
			.collection("todos")
			.document(newItem.id)
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
