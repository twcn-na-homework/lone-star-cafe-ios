@testable import Cafe
import XCTest

final class ReceiptViewModelTests: XCTestCase {
    func test_should_return_0_when_there_no_selected_item() {
        let viewModel = ReceiptViewModel.init(selectedItems: [])
        let price = viewModel.calcPrices()
        
        XCTAssertEqual(price.subtotal, 0)
        XCTAssertEqual(price.discount, 0)
        XCTAssertEqual(price.subtotal, 0)
        XCTAssertEqual(price.tax, 0)
    }
}
