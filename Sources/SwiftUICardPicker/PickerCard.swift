import SwiftUI

public struct PickerCard<Content: View>: View {

    var checked: Bool
    @ViewBuilder var content: Content

    public var body: some View {
            content
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay {
                    Image(systemName: checked ? "checkmark.circle.fill" : "circle")
                        .font(.title2)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .foregroundStyle(Color.accentColor)
                }

        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.regularMaterial)
        }

    }
}

#Preview {
    VStack {
        PickerCard(checked: false) {
            Text("Unchecked option")
        }
        PickerCard(checked: true) {
            Text("Checked option")
        }
    }
}
