import SwiftUI

struct _XGm0019Bl: View {
    let _xGm0063: [_XGm0006Bl]
    let _xGm0062: Int
    @Environment(\.dismiss) private var dismiss
    @State private var _xGm0061: Int

    init(works: [_XGm0006Bl], start: Int) {
        self._xGm0063 = works
        self._xGm0062 = start
        __xGm0061 = State(initialValue: start)
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.black.ignoresSafeArea()
            TabView(selection: $_xGm0061) {
                ForEach(Array(_xGm0063.enumerated()), id: \.offset) { idx, work in
                    VStack(spacing: 18) {
                        Spacer()
                        _XGm0026Bl(_xGm0010: work)
                        VStack(spacing: 4) {
                            Text(work._xGm0017).font(_XGm0033Bl._xGm0017(18)).foregroundStyle(.white).multilineTextAlignment(.center)
                            Text(work._xGm0027).font(_XGm0033Bl._xGm0027(13)).foregroundStyle(.white.opacity(0.6))
                        }
                        .padding(.horizontal, 30)
                        Spacer()
                    }
                    .tag(idx)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            Button { dismiss() } label: {
                Image(systemName: "xmark").font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white).padding(12)
                    .background(Circle().fill(.white.opacity(0.12)))
            }
            .padding(.trailing, 20).padding(.top, 12)
        }
    }
}
