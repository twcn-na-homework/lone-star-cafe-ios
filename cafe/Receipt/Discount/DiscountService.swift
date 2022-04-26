protocol DiscountServiceProtocol {
    func fetchDiscount(completion: @escaping ([Discount]) -> Void)
}

typealias DiscountDTO = FetchDiscountsQuery.Data.Discount

final class DiscountService: DiscountServiceProtocol {
    func fetchDiscount(completion: @escaping ([Discount]) -> Void) {
        Network.shared.apollo.fetch(query: FetchDiscountsQuery()) {
            result in switch result {
            case .success(let graphQLResult):
                completion(self.transform(graphQLResult.data?.discount ?? []))
            case .failure(let error):
                print("Failure! Error: \(error)")
                completion([])
            }
        }
    }
    
    private func transform(_ models: [DiscountDTO]) -> [Discount] {
        models.map {
            Discount(code: $0.code,
                     discountPct: $0.discountPct,
                     discountAmout: $0.discountAmount,
                     applyOn: $0.applyOn)
        }
    }
}

