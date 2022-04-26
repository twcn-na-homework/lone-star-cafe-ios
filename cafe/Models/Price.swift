//
//  Price.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/24.
//

import Foundation

protocol PriceFormatterProtocol {
	func formatWithTwoDigit(_ price: Int, _ count: Int) -> String
}

struct Price: PriceFormatterProtocol {
	
	func formatWithTwoDigit(_ price: Int, _ count: Int) -> String {
		"$ " + String(format: "%.2f", Double(price * count) / 100.0)
	}
}
