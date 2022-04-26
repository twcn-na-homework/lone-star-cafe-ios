import Foundation
import SwiftUI

protocol DiscountCodeListInputProtocol {
	func fetchDiscountCode()
}

final class DiscountCodeListViewModel: ObservableObject, DiscountCodeListInputProtocol {
	@Published var code: Discount? = nil
    @Published var selectedType: DiscountType = .none
	@Published private(set) var codeList: [Discount] = []
    @Published var showAlert: Bool = false
    
	private let service: DiscountServiceProtocol
	
	init(service: DiscountServiceProtocol) {
		self.service = service
	}
	
	func fetchDiscountCode() {
		service.fetchDiscount { [weak self] (result: [Discount]) in
            self?.codeList = result
		}
	}
	
	func setDiscountCode(_ discountCode: Discount) {
		code = discountCode
	}
	
	func printDiscountInfo(_ code: Discount) -> String {
		
		let applyOn = code.applyOn.map { "\($0)" }
		.joined(separator: ", ")
		.lowercased()
		
		var discountType = ""
		
		if let percentage = code.discountPct {
			discountType += "Percentage: \(percentage)%"
		}
		
		if let amount = code.discountAmout {
			discountType +=
			"Amount: \(Price.formatWithTwoDigit(amount, 1))"
		}
		
		return 	"""
				\(discountType)
				applyOn: \(applyOn)
				"""
	}
}

private extension Price {
    static func formatWithTwoDigit(_ price: Int, _ count: Int) -> String {
        "$ " + String(format: "%.2f", Double(price * count) / 100.0)
    }
}
