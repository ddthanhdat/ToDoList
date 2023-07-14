//
//  HeaderView.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import SwiftUI

struct HeaderView: View {
	let title: String
	let subtitle: String
	var backgroundColor: Color? = .pink
	var angel: Double? = 15.0
	
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 0)
				.foregroundColor(backgroundColor)
				.rotationEffect(Angle(degrees: angel ?? 15.0))
			VStack {
				Text(title)
					.font(.system(size: 50))
					.foregroundColor(Color.white)
					.bold()
				
				Text(subtitle)
					.font(.system(size: 30))
					.foregroundColor(Color.white)
			}
			.padding(.top, 30)
		}
		.frame(width: UIScreen.main.bounds.width * 3, height: 300)
		.offset(y: -100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
		HeaderView(title: "To Do List", subtitle: "Get things done", backgroundColor: .pink, angel: 30)
    }
}
