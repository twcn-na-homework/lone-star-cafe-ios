//
//  ReceiptItemViewModelSwiftUI.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/28.
//

import Foundation
import SwiftUI

class ReceiptItemVewModelSwiftUI: ObservableObject {
	
	@Published private(set) var item: Item
	@Binding var selectedItems: [Item]
	@Binding var itemCountTable: [String: Int]
	
	init(item: Item, selectedItems: Binding<[Item]>, itemCountTable: Binding<[String: Int]>) {
		self.item = item
		_selectedItems = selectedItems
		_itemCountTable = itemCountTable
	}
	
	func addOneItem() {
		let result = itemCountTable[item.name]!
		itemCountTable[item.name] = result + 1
	}
	
	func removeOneItem() {
		let result = itemCountTable[item.name]!
		if result == 1 {
			deleteOneItem()
		} else {
			itemCountTable[item.name] = result - 1
		}
	}
	
	func deleteOneItem() {
		selectedItems = selectedItems.filter {
			$0.name != item.name
		}
	}
}
