import SwiftUI

struct DiscountCodeList: View {
    @StateObject var viewModel: DiscountCodeListViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Text("Choose a discount code below:").bold()
            List(viewModel.codeList) { code in
                Button(
                    action: {
                        viewModel.showAlert = true
                        viewModel.setDiscountCode(code)
                    }, label: {
                        VStack(alignment: .leading) {
                            Text("Code: \(code.code)")
                            Text(viewModel.printDiscountInfo(code))
                        }
                        .frame(height: 75)
                    }
                )
            }
            .listStyle(PlainListStyle())
        }
        .actionSheet(isPresented: $viewModel.showAlert) {
            ActionSheet(
                title: Text("Select Discount Type"),
                buttons: alertButtons
            )
        }
        .onAppear {
            viewModel.fetchDiscountCode()
        }
    }

    private var alertButtons: [ActionSheet.Button] {
        var btns: [ActionSheet.Button] =  [
            .cancel(),
            .default(Text("No Discount")) {
                self.viewModel.selectedType = .none
                presentationMode.wrappedValue.dismiss()
            }
        ]
        
        if viewModel.code?.discountAmout != nil {
            btns.append(
                .default(Text("Amount")) {
                    self.viewModel.selectedType = .amount
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
        
        if viewModel.code?.discountPct != nil {
            btns.append(
                .default(Text("Percentage")) {
                    self.viewModel.selectedType = .percentage
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
        
        return btns
    }
}
