import Foundation
import SwiftUI

public struct PlainFlashingButtonStyle: ButtonStyle {

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.5 : 1)
    }

}
