//
//  MenuListService.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/18.
//

import Foundation

typealias MenuItem = FetchMenuItemsQuery.Data.Menu

protocol MenuServiceProtocol {
	func fetchMenu(completion: @escaping ([Item]) -> Void)
}

final class MenuService: MenuServiceProtocol {
	func fetchMenu(completion: @escaping ([Item]) -> Void) {
		Network.shared.apollo.fetch(query: FetchMenuItemsQuery()) { result in
			switch result {
				case .success(let graphQLResult):
					completion(self.transform(graphQLResult.data?.menu ?? []))
				case .failure(let error):
					print("Failure! Error: \(error)")
			}
		}
	}
	
	private func transform(_ models: [MenuItem]) -> [Item] {
		
		models.map {
			let id = $0.id, name = $0.description,
				price = $0.price, type = $0.type
			return Item(id: id, name: name, price: price, type: type)
		}
	}
}

