//
//  DiscountCodeListViewModelSwiftUI.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/27.
//

import Foundation
import SwiftUI

protocol DiscountCodeListInputProtocol {
	func fetchDiscountCode()
}

class DiscountCodeListViewModelSwiftUI: ObservableObject, DiscountCodeListInputProtocol {
	
	@Binding var code: DiscountCode?
	@Published private(set) var codeList: [DiscountCode] = []
	private let service: DiscountServiceProtocol
	
	init(code: Binding<DiscountCode?>, service: DiscountServiceProtocol) {
		_code = code
		self.service = service
	}
	
	func fetchDiscountCode() {
		service.fetchDiscount {
			(result: [DiscountCode]) in self.codeList = result
		}
	}
	
	func setDiscountCode(_ discountCode: DiscountCode) {
		code = discountCode
	}
	
	func printDiscountInfo(_ code: DiscountCode) -> String {
		
		let applyOn = code.applyOn.map { "\($0)" }
		.joined(separator: ", ")
		.lowercased()
		
		var discountType = ""
		
		if let percentage = code.discountPct {
			discountType += "Percentage: \(percentage)%"
		}
		
		if let amount = code.discountAmout {
			discountType +=
			"Amount: \(Price().formatWithTwoDigit(amount, 1))"
		}
		
		return 	"""
				\(discountType)
				applyOn: \(applyOn)
				"""
	}
}
