import SwiftUI

public struct CardPicker<Content: View, Selection: Hashable>: View {

    @Binding var selection: Selection
    @ViewBuilder var content: Content

    public var body: some View {
        VStack {
            ForEach(subviews: content) { subview in
                PickerCard(checked: subview.containerValues.tag(for: Selection.self) == selection) {
                    subview
                }
                .onTapGesture {
                    let selectedValue = subview.containerValues.tag(for: Selection.self)
                    if let selectedValue {
                        selection = selectedValue
                    }
                }
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
                Text(option.label)
                    .fontWeight(.semibold)
                    .padding(.leading)
            }
        }
    }
}
