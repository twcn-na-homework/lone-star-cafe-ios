
@testable import Cafe
import Quick
import Nimble

class ReceiptViewModelSpec: QuickSpec {
    override func spec() {
        describe("ReceiptViewModel") {
            context("calcPrices tests") {
                it("All prices should return 0 when there is no selected item") {
                    let viewModel = ReceiptViewModel.init(selectedItems: [])
                    let price = viewModel.calcPrices()

                    expect(price.subtotal).to(equal(0))
                    expect(price.discount).to(equal(0))
                    expect(price.tax).to(equal(0))
                    expect(price.total).to(equal(0))
                }
            }
        }
    }
}
