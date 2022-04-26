//
//  MenuItemSwiftUI.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/18.
//

import SwiftUI
import struct Kingfisher.KFImage

struct MenuItemSwiftUI: View {
	
	@ObservedObject var viewModel: MenuItemViewModelSwiftUI
	
	var body: some View {
		HStack {
			KFImage(URL(string: viewModel.imageUrl))
				.resizable()
				.frame(width: 50, height: 50)
				.padding(.horizontal, 10)
			
			Text(viewModel.item.name)
			
			Spacer()
			
			VStack(alignment: .center, spacing: 5) {
				Text("\(Price().formatWithTwoDigit(viewModel.item.price, 1))")
				ZStack {
					viewModel.isItemSelected() ? Color.yellow : Color.blue
					Button(action: {
						viewModel.tapButton()
					}) {
						(viewModel.isItemSelected() ?
						 Text("added")
						 : Text("add to cart"))
						.font(.system(size: 12))
						.foregroundColor(.white)
					}
					.buttonStyle(BorderlessButtonStyle())
				}
				.frame(width: 80, height: 40)
				.cornerRadius(10)
			}
		}.frame(height: 100)
	}
}
