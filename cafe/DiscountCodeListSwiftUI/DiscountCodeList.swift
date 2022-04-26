//
//  DiscountCodeList.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/27.
//

import SwiftUI

struct DiscountCodeList: View {
	
	@StateObject var viewModel: DiscountCodeListViewModelSwiftUI
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	
	var body: some View {
		VStack {
			Text("Please choose a discount code below:")
			List(viewModel.codeList) { code in
				Button(
					action: {
						viewModel.setDiscountCode(code)
						presentationMode.wrappedValue.dismiss()
					}, label: {
						VStack(alignment: .leading) {
							Text("Code: \(code.code)")
							Text(viewModel.printDiscountInfo(code))
						}
						.frame(height: 75)
					}
				)
			}
			.listStyle(PlainListStyle())
		}
		.onAppear {
			viewModel.fetchDiscountCode()
		}
	}
}

