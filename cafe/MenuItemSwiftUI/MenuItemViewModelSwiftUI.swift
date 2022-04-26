//
//  MenuItemViewModelSwiftUI.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/23.
//

import Foundation
import SwiftUI

class MenuItemViewModelSwiftUI: ObservableObject {
	
	@Binding var selectedItems: [Item]
	var item: Item
	var imageUrl: String {
		return ""
	}

	init(item: Item, selectedItems: Binding<[Item]>) {
		self.item = item
		_selectedItems = selectedItems
	}
	
	func isItemSelected() -> Bool {
		selectedItems.contains(item)
	}
	
	private func removeItemFromSelectedItems() {
		selectedItems = selectedItems.filter { $0.name != item.name }
	}
	
	private func addItemToSelectedItems() {
		selectedItems += [item]
	}
	
	func tapButton() {
		isItemSelected() ?
			removeItemFromSelectedItems()
			: addItemToSelectedItems()
	}
}
