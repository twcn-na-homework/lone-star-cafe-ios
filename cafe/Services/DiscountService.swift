//
//  DiscountService.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/24.
//

import Foundation

typealias Discount = FetchDiscountsQuery.Data.Discount

protocol DiscountServiceProtocol {
	func fetchDiscount(completion: @escaping ([DiscountCode]) -> Void)
}

final class DiscountService: DiscountServiceProtocol {
	
	func fetchDiscount(completion: @escaping ([DiscountCode]) -> Void) {
		Network.shared.apollo.fetch(query: FetchDiscountsQuery()) {
			result in switch result {
				case .success(let graphQLResult):
					completion(self.transform(graphQLResult.data?.discount ?? []))
				case .failure(let error):
					print("Failure! Error: \(error)")
			}
		}
	}
	
	private func transform(_ models: [Discount]) -> [DiscountCode] {
		
		models.map {
			let code = $0.code, discountPct = $0.discountPct, discountAmount = $0.discountAmount, applyOn = $0.applyOn
			
			return DiscountCode(code: code, discountPct: discountPct, discountAmout: discountAmount, applyOn: applyOn)
		}
	}
}
