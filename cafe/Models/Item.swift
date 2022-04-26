//
//  Item.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/24.
//

import Foundation

struct Item: Identifiable, Equatable {
	var id: String
	var name: String
	var price: Int
	var type: ItemType
}

