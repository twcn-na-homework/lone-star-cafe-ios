import SwiftUI

struct ReceiptView: View {
    @StateObject var viewModel: ReceiptViewModel

    var body: some View {
        VStack {
            Text("My Receipt View")
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
        NavigationView {
            ReceiptView(viewModel: ReceiptViewModel(selectedItems: []))
                    .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#endif
