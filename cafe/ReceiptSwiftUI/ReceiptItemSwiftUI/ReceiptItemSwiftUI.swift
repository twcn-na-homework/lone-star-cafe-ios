//
//  ReceiptItemSwiftUI.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/28.
//

import SwiftUI

struct ReceiptItemSwiftUI: View {
	
	@ObservedObject var viewModel: ReceiptItemVewModelSwiftUI
	
	var body: some View {
		HStack {
			Button(
				action: {
					viewModel.addOneItem()
				}
			) {
				Image(systemName: "plus.circle.fill")
					.foregroundColor(.pink)
			}
			.buttonStyle(BorderlessButtonStyle())
			
			Text("\(viewModel.itemCountTable[viewModel.item.name]!)")
			
			Button(
				action: {
					viewModel.removeOneItem()
				}
			) {
				Image(systemName: "minus.circle.fill")
					.foregroundColor(.pink)
			}
			.buttonStyle(BorderlessButtonStyle())
			
			Text("\(viewModel.item.name)")
			
			Spacer()
			
			Text("\(Price().formatWithTwoDigit(viewModel.item.price, viewModel.itemCountTable[viewModel.item.name]!))")
			
			Button(
				action: {
					viewModel.deleteOneItem()
				}
			) {
				Image(systemName: "trash")
			}
			.buttonStyle(BorderlessButtonStyle())
		}
		.frame(height: 75)
	}
}
