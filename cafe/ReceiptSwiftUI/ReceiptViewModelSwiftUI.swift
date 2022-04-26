//
//  ReceiptViewModelSwiftUI.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/21.
//

import Foundation
import SwiftUI

class ReceiptViewModelSwiftUI: ObservableObject {
	
	@Binding var selectedItems: [Item]
	@Published var itemCountTable: [String: Int]
	@Published var code: DiscountCode? = nil
	
	init(selectedItems: Binding<[Item]>, itemCountTable: [String: Int]) {
		_selectedItems = selectedItems
		self.itemCountTable = itemCountTable
	}
	
	func addOneItem(_ item: Item) {
		let result = itemCountTable[item.name]!
		itemCountTable[item.name] = result + 1
	}
	
	func removeOneItem(_ item: Item) {
		let result = itemCountTable[item.name]!
		if result == 1 {
			deleteOneItem(item)
		} else {
			itemCountTable[item.name] = result - 1
		}
	}
	
	func deleteOneItem(_ item: Item) {
		selectedItems = selectedItems.filter { $0.name != item.name }
	}
}
