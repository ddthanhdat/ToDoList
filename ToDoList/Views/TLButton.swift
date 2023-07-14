//
//  TLButton.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import SwiftUI

struct TLButton: View {
	var title: String? = ""
	var background: Color? = .blue
	var action: (() -> Void)? = {}
	
    var body: some View {
		Button {
			action?()
		} label: {
			ZStack{
				RoundedRectangle(cornerRadius: 10)
					.foregroundColor(background)
				
				Text(title ?? "")
					.foregroundColor(.white)
					.bold()
			}
		}
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Demo")
    }
}
