import SwiftUI

struct DashLine: View {
    struct DashLineShape: Shape {
        func path(in rect: CoreGraphics.CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            return path
        }
    }

    var body: some View {
        DashLineShape()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [3]))
                .frame(maxHeight: 1)
                .foregroundColor(.gray)

    }
}