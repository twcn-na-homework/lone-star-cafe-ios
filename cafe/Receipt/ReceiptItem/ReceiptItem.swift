import SwiftUI

struct ReceiptItem: View {
    let viewModel: ReceiptItemViewModel

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(viewModel.title)
                Spacer()
                Text("$").foregroundColor(.gray)
                Text(viewModel.price)
            }.padding(.init(top: 4, leading: 16, bottom: 4, trailing: 16))
            DashLine()
        }
    }
}