//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import Foundation

import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModel: ObservableObject {
	
	init () {
		
	}
	
	func toggleIsDone(item: ToDoListItemModel) {
		var newItem = item
		newItem.setDone(!item.isDone)
		
		guard let userId = Auth.auth().currentUser?.uid else {
			return
		}
		
		let db = Firestore.firestore()
		db.collection("users")
			.document(userId)
			.collection("todos")
			.document(item.id)
			.setData(newItem.asDictionary())
	}
}
