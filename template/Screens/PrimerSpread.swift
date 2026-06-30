import SwiftUI

struct _XGm0021Bl: View {
    @EnvironmentObject private var _xGm0007: _XGm0002Bl
    @State private var _xGm0069 = 0

    private let _xGm0070: [_XGm0022Bl] = [
        _XGm0022Bl(_xGm0073: "I", _xGm0046: "Wander the collection", body: "Search a museum of masterpieces, or let the wall surface something you've never seen."),
        _XGm0022Bl(_xGm0073: "II", _xGm0046: "Hang your own salon", body: "Save works to your private gallery and keep a list of pieces to see in person."),
        _XGm0022Bl(_xGm0073: "III", _xGm0046: "Look, slowly", body: "Open any work full-bleed and swipe through your collection like a quiet exhibition.")
    ]

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("GALLEA").font(_XGm0033Bl._xGm0008(13)).tracking(4).foregroundStyle(_XGm0032Bl._xGm0106)
                Spacer()
                Button("Skip") { _xGm0007._xGm0003() }.font(_XGm0033Bl._xGm0008(13)).foregroundStyle(_XGm0032Bl._xGm0107)
            }
            .padding(.horizontal, 28).padding(.top, 18)

            TabView(selection: $_xGm0069) {
                ForEach(Array(_xGm0070.enumerated()), id: \.offset) { i, p in _xGm0071(p).tag(i) }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            _xGm0072
        }
        .background(_XGm0032Bl._xGm0103.ignoresSafeArea())
    }

    private func _xGm0071(_ p: _XGm0022Bl) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            Text(p._xGm0073)
                .font(.system(size: 80, weight: .regular, design: .serif))
                .foregroundStyle(_XGm0032Bl._xGm0108)
            Rectangle().fill(_XGm0032Bl._xGm0106).frame(width: 60, height: 1).padding(.vertical, 18)
            Text(p._xGm0046)
                .font(_XGm0033Bl._xGm0017(30))
                .foregroundStyle(_XGm0032Bl._xGm0106)
            Text(p.body)
                .font(_XGm0033Bl._xGm0027(16))
                .foregroundStyle(_XGm0032Bl._xGm0107)
                .padding(.top, 14)
                .lineSpacing(5)
            Spacer(); Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 34)
    }

    private var _xGm0072: some View {
        VStack(spacing: 18) {
            HStack(spacing: 8) {
                ForEach(0..<_xGm0070.count, id: \.self) { i in
                    Rectangle().fill(i == _xGm0069 ? _XGm0032Bl._xGm0108 : _XGm0032Bl._xGm0110)
                        .frame(width: i == _xGm0069 ? 24 : 10, height: 2)
                }
            }
            Button(_xGm0069 == _xGm0070.count - 1 ? "Enter the gallery" : "Next") {
                if _xGm0069 == _xGm0070.count - 1 { _xGm0007._xGm0003() }
                else { withAnimation { _xGm0069 += 1 } }
            }
            .buttonStyle(_XGm0035Bl(_xGm0113: true))
            .padding(.horizontal, 34)
        }
        .padding(.bottom, 40)
    }
}

private struct _XGm0022Bl { let _xGm0073: String; let _xGm0046: String; let body: String }
