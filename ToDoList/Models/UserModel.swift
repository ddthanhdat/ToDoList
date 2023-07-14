//
//  UserModel.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import Foundation


struct UserModel: Codable {
	let id: String
	let name: String
	let email: String
	let joined: TimeInterval
}
