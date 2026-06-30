import SwiftUI

struct _XGm0020Bl: View {
    @EnvironmentObject private var _xGm0007: _XGm0002Bl
    @State private var _xGm0064: CGFloat = 0.7
    @State private var _xGm0065: Double = 0
    @State private var _xGm0066: CGFloat = 0
    @State private var _xGm0067 = false

    var body: some View {
        ZStack {
            _XGm0032Bl._xGm0103.ignoresSafeArea()
            VStack(spacing: 34) {
                Spacer()
                Rectangle()
                    .strokeBorder(_XGm0032Bl._xGm0106, lineWidth: 2)
                    .frame(width: 150, height: 190)
                    .overlay(
                        Rectangle().fill(_XGm0032Bl._xGm0108).frame(width: 18, height: 18)
                    )
                    .scaleEffect(_xGm0064)
                    .opacity(_xGm0065)

                VStack(spacing: 14) {
                    Rectangle().fill(_XGm0032Bl._xGm0106).frame(width: _xGm0066, height: 1)
                    Text("GALLEA")
                        .font(.system(size: 34, weight: .regular, design: .serif))
                        .tracking(10)
                        .foregroundStyle(_XGm0032Bl._xGm0106)
                        .opacity(_xGm0067 ? 1 : 0)
                    Text("a gallery in your pocket")
                        .font(_XGm0033Bl._xGm0027(13))
                        .foregroundStyle(_XGm0032Bl._xGm0107)
                        .opacity(_xGm0067 ? 1 : 0)
                }
                Spacer(); Spacer()
            }
        }
        .onAppear(perform: _xGm0068)
    }

    private func _xGm0068() {
        withAnimation(.spring(response: 0.7, dampingFraction: 0.7)) { _xGm0064 = 1; _xGm0065 = 1 }
        withAnimation(.easeOut(duration: 0.7).delay(0.5)) { _xGm0066 = 160 }
        withAnimation(.easeOut(duration: 0.6).delay(0.8)) { _xGm0067 = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) { self._xGm0007._xGm0002() }
    }
}
