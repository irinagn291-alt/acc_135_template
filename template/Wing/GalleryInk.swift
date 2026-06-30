import SwiftUI

enum _XGm0032Bl {
    static let _xGm0103 = _xGm0111("FAFAF8")
    static let _xGm0104 = _xGm0111("FFFFFF")
    static let _xGm0105 = _xGm0111("F0EFEB")

    static let _xGm0106 = _xGm0111("111111")
    static let _xGm0107 = _xGm0111("6E6E6E")
    static let _xGm0108 = _xGm0111("C8553D")
    static let _xGm0109 = _xGm0111("9A9A9A")
    static let _xGm0110 = _xGm0111("E4E2DC")

    static func _xGm0111(_ s: String) -> Color {
        var c = s; if c.hasPrefix("#") { c.removeFirst() }
        var n: UInt64 = 0; Scanner(string: c).scanHexInt64(&n)
        return Color(.sRGB, red: Double((n >> 16) & 255)/255, green: Double((n >> 8) & 255)/255, blue: Double(n & 255)/255, opacity: 1)
    }
}

enum _XGm0033Bl {
    static func _xGm0112(_ s: CGFloat) -> Font { .system(size: s, weight: .regular, design: .serif) }
    static func _xGm0017(_ s: CGFloat) -> Font { .system(size: s, weight: .medium, design: .serif) }
    static func _xGm0027(_ s: CGFloat) -> Font { .system(size: s, weight: .regular, design: .default) }
    static func _xGm0008(_ s: CGFloat) -> Font { .system(size: s, weight: .semibold, design: .default) }
}

enum _XGm0034Bl {
    static let _xGm0142: CGFloat = 2
    static let _xGm0143: CGFloat = 24
}

struct _XGm0035Bl: ButtonStyle {
    var _xGm0113 = false
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(_XGm0033Bl._xGm0008(15))
            .tracking(0.5)
            .foregroundStyle(_xGm0113 ? _XGm0032Bl._xGm0103 : _XGm0032Bl._xGm0106)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                Rectangle().fill(_xGm0113 ? _XGm0032Bl._xGm0106 : Color.clear)
            )
            .overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0106, lineWidth: 1))
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}
