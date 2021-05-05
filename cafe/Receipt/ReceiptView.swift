import SwiftUI

struct ReceiptView: View {
    @StateObject var viewModel: ReceiptViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer().frame(height: 8)
            Divider()
                .frame(height: 2)
                .background(Color.init(white: 0, opacity: 0.15))
            ForEach(viewModel.items) { item in
                ReceiptItem(viewModel: .init(item: item))
            }
            Spacer().frame(height: 32)
            Divider()
                .frame(height: 2)
                .background(Color.init(white: 0, opacity: 0.15))
            Spacer()

        }.actionSheet(isPresented: $viewModel.showDiscountChoose) {
            ActionSheet(title: Text("Test"),
                        message: Text(viewModel.discountDesc),
                        buttons: [
                            .default(Text("Percentage")) {
                                viewModel.discountType = .percentage
                            },
                            .default(Text("No Discount")) {
                                viewModel.discountType = .none
                            },
                            .default(Text(" Amount")) {
                                viewModel.discountType = .amount
                            },
                            .cancel(Text("Dismiss"))
                        ])
        }
        .navigationBarItems(trailing: Button("...") {
            viewModel.showDiscountChoose = true
        })
        .navigationTitle("Receipt")
    }
}

#if DEBUG
struct ReceiptView_Previews: PreviewProvider {
    static var previews: some View {
        let items: [MenuListViewModel.MenuItem] = [
            .init(id: "1", type: .dishes, price: 10, description: "Cafe1"),
            .init(id: "2", type: .dishes, price: 10, description: "Cafe2")
        ]
        
        NavigationView {
            ReceiptView(viewModel: ReceiptViewModel(selectedItems: items))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#endif
