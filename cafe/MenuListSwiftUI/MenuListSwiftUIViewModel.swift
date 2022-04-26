//
//  MenuListSwiftUIViewModel.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/16.
//

import SwiftUI

protocol MenuListInputProtocol {
	func fetchMenu()
}

class MenuListSwiftUIViewModel: ObservableObject, MenuListInputProtocol {
	
	@Published private(set) var menu: [Item] = []
	@Published var selectedItems: [Item] = []
	
	private let service: MenuServiceProtocol
	
	init(service: MenuServiceProtocol) {
		self.service = service
	}
	
	func fetchMenu() {
		service.fetchMenu { (result: [Item]) in
			self.menu = result
		}
	}
	
	func createItemCountTable() -> [String: Int] {
		selectedItems.reduce(into: [:]) { result, item in
			result[item.name] = 1
		}
	}
}
