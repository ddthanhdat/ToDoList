//
//  ToDoListView.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore

struct ToDoListView: View {
	@StateObject var viewModel: ToDoListViewViewModel
	private let userId: String
	
	init(userId: String) {
		self.userId = userId
		self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))

	}

    var body: some View {
		NavigationView {
			VStack {
				List(viewModel.items) { item in
					ToDoListItemView(item: item)
						.swipeActions {
							Button {
								viewModel.delete(id: item.id)
							} label: {
								Text("Delete")
							}.tint(.red)
							
							Button {
								viewModel.showUpdate(item: item)
							} label: {
								Text("Edit")
							}.tint(.blue)

						}
				}
				Spacer()
			}
			.navigationTitle("To Do List")
			.toolbar {
				Button {
					viewModel.showingNewItemView = true
				} label: {
					Image(systemName: "plus")
				}
			}
			.sheet(isPresented: $viewModel.showingNewItemView) {
				NewItemView(showingNewItemView: $viewModel.showingNewItemView)
			}
			.sheet(isPresented: $viewModel.showingUpdateItemView) {
				UpdateItemView(
					viewModel: UpdateItemViewViewModel(item: viewModel.itemUpdate ?? ToDoListItemModel.NOOB),
					showingNewItemView: $viewModel.showingUpdateItemView
				)
			}
		}
	}
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "123")
    }
}
