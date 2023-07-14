//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class ToDoListViewViewModel: ObservableObject {
	@Published var showingNewItemView: Bool = false
	@Published var showingUpdateItemView: Bool = false
	@Published var items: [ToDoListItemModel] = []
	@Published var itemUpdate: ToDoListItemModel? = nil
	
	private let userId: String
	private let db = Firestore.firestore()
	
	init (userId: String) {
		self.userId = userId
		self.getData()
	}
	
	func getData() {
		guard !userId.isEmpty && userId != "123" else {
			return
		}
		db.collection("/users/\(userId)/todos").addSnapshotListener { snapshot, error in
			guard error == nil else {
//				print(error)
				return
			}
			var a: [ToDoListItemModel] = []
			for document in snapshot!.documents {
				print(document.data())
				let data = document.data()
				let id = data["id"] as? String ?? ""
				let title = data["title"] as? String ?? ""
				let dueDate = data["dueDate"] as? Int ?? 0
				let createdDate = data["createdDate"] as? Int ?? 0
				let isDone = data["isDone"] as? Bool ?? false
				
				a.append(ToDoListItemModel(
					id: id,
					title: title,
					dueDate: TimeInterval(dueDate),
					createdDate: TimeInterval(createdDate),
					isDone: isDone
				))
			}
			self.items = a
		}
	
		
	}
	
	func delete(id: String) {
		db.collection("users")
			.document(userId)
			.collection("todos")
			.document(id)
			.delete()
	}
	
	
	func showUpdate(item: ToDoListItemModel) {
		self.showingUpdateItemView = true
		self.itemUpdate = item
	}
}
