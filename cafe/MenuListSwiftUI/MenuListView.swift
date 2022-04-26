//
//  MenuListView.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/16.
//

import SwiftUI
import struct Kingfisher.KFImage

struct MenuListView: View {
    
    @StateObject var viewModel: MenuListSwiftUIViewModel
    
    var body: some View {
		VStack {
			List(viewModel.menu) { item in
				MenuItemSwiftUI(
					viewModel: MenuItemViewModelSwiftUI(
						item: item, selectedItems: $viewModel.selectedItems
					)
				)
            }
			.listStyle(PlainListStyle())
			.padding(.bottom, 15)
			HStack {
				Text("\(viewModel.selectedItems.count) Items")
					.bold()
				Spacer()
				NavigationLink(
					destination: ReceiptViewSwiftUI(
						viewModel: ReceiptViewModelSwiftUI(
							selectedItems: $viewModel.selectedItems,
							itemCountTable: viewModel.createItemCountTable()
						)
					),
					label: {
						ZStack {
							Color.blue
							Text("Pay Now")
								.bold()
								.foregroundColor(Color.white)
						}
						.frame(width: 100, height: 50)
						.cornerRadius(10)
					}
				)
			}
            .padding(EdgeInsets(top: 0, leading: 50, bottom: 10, trailing: 30))
        }
		.padding(.top, 100)
        .onAppear {
            viewModel.fetchMenu()
        }
    }
}


