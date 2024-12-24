import SwiftUI

public struct CardPicker<Content: View, Selection: Hashable>: View {

    @Binding var selection: Selection
    @ViewBuilder var content: Content

    public init(selection: Binding<Selection>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }

    public var body: some View {
        VStack {
            ForEach(subviews: content) { subview in
                Button {
                    let selectedValue = subview.containerValues.tag(for: Selection.self)
                    if let selectedValue {
                        selection = selectedValue
                    }
                } label: {
                    PickerCard(checked: subview.containerValues.tag(for: Selection.self) == selection) {
                        subview
                    }
                }
                .buttonStyle(PlainFlashingButtonStyle())
            }
        }
    }
}

struct Option: Hashable {
    let label: String
    let imageSystemName: String
}

let lightModeOption = Option(label: "Light mode", imageSystemName: "sun.horizon")

let darkModeOption = Option(label: "Dark mode", imageSystemName: "moon")

let options = [
    lightModeOption,
    darkModeOption
]

#Preview {
    @Previewable @State var selection: Option? = lightModeOption
    CardPicker(selection: $selection) {
        ForEach(options, id: \.self) { option in
            HStack {
                Image(systemName: option.imageSystemName)
                VStack {
                    Text(option.label)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Lorem ipsum dolor sit amet")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading)
            }
        }
    }
    .padding()
}
