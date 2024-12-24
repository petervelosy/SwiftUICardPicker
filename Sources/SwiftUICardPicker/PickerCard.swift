import SwiftUI

public struct PickerCard<Content: View>: View {

    var checked: Bool
    @ViewBuilder var content: Content

    public init(checked: Bool, @ViewBuilder content: () -> Content) {
        self.checked = checked
        self.content = content()
    }

    public var body: some View {
            content
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay {
                    Image(systemName: checked ? "checkmark.circle.fill" : "circle")
                        .font(.title3)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .foregroundStyle(Color.accentColor)
                        .animation(.easeInOut(duration: 0.2), value: checked)
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
