//
//  ToDoListItemModel.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import Foundation



struct ToDoListItemModel: Codable, Identifiable {
	let id: String
	let title: String
	let dueDate: TimeInterval
	let createdDate: TimeInterval
	var isDone: Bool
	
	mutating func setDone(_ state: Bool) {
		isDone = state
	}
	
	static var NOOB = ToDoListItemModel(id: "", title: "", dueDate: TimeInterval(), createdDate: TimeInterval(), isDone: true)
	
	static func getNoob() -> ToDoListItemModel{
		return ToDoListItemModel(id: "", title: "", dueDate: TimeInterval(), createdDate: TimeInterval(), isDone: true)
	}
}
