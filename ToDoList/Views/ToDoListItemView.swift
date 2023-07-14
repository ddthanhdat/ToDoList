//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import SwiftUI

struct ToDoListItemView: View {
	@StateObject var viewModel = ToDoListItemViewViewModel()
	let item: ToDoListItemModel
	
    var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Text(item.title)
					.font(.system(size: 28))
					.bold()
				Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
					.font(.footnote)
					.foregroundColor(Color.secondary)
			}
			
			Spacer()
			
			Button {
				viewModel.toggleIsDone(item: item)
			} label: {
				Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
			}

		}
		
	}
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: ToDoListItemModel(
			id: "123",
			title: "Demo",
			dueDate: TimeInterval(),
			createdDate: TimeInterval(),
			isDone: true
		))
    }
}
