//
//  ReceiptViewSwiftUI.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/17.
//

import SwiftUI

struct ReceiptViewSwiftUI: View {
	
	@ObservedObject var viewModel: ReceiptViewModelSwiftUI
	
	var body: some View {
		VStack {
			List(viewModel.selectedItems) { item in
				ReceiptItemSwiftUI(
					viewModel: ReceiptItemVewModelSwiftUI(
						item: item, selectedItems: $viewModel.selectedItems, itemCountTable: $viewModel.itemCountTable
					)
				)
			}
			.listStyle(PlainListStyle())
			.frame(maxHeight: 450)
			NavigationLink(
				destination: DiscountCodeList(
					viewModel: DiscountCodeListViewModelSwiftUI(code: $viewModel.code, service: DiscountService())
				),
				label: {
					HStack {
						Text("Click to choose a discount code: ")
							.foregroundColor(.black)
							.padding(.leading, 20)
						Spacer()
						Text(viewModel.code?.code ?? "")
							.foregroundColor(.black)
							.padding(.trailing, 20)
					}
				}
			)
			Spacer()
		}
	}
}
