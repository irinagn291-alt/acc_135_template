import SwiftUI

struct _XGm0023Bl: View {
    @EnvironmentObject private var _xGm0006: _XGm0031Bl
    @State private var _xGm0074: _XGm0004Bl = ._xPm0001
    @State private var _xGm0075: Int?

    private let _xGm0076 = [GridItem(.flexible(), spacing: 2), GridItem(.flexible(), spacing: 2)]

    var body: some View {
        VStack(spacing: 16) {
            _xGm0078
            _xGm0079
        }
        .background(_XGm0032Bl._xGm0103.ignoresSafeArea())
        .navigationTitle("Saved")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(item: Binding(
            get: { _xGm0075.map { _XGm0024Bl(_xGm0080: $0) } },
            set: { _xGm0075 = $0?._xGm0080 }
        )) { seed in
            _XGm0019Bl(works: _xGm0077.map(\._xGm0010), start: seed._xGm0080)
        }
    }

    private var _xGm0077: [_XGm0005Bl] { _xGm0006._xGm0126(_xGm0074) }

    private var _xGm0078: some View {
        HStack(spacing: 24) {
            ForEach(_XGm0004Bl.allCases) { p in
                Button { withAnimation { _xGm0074 = p } } label: {
                    VStack(spacing: 6) {
                        Text(p._xGm0008).font(_XGm0033Bl._xGm0008(14)).foregroundStyle(_xGm0074 == p ? _XGm0032Bl._xGm0106 : _XGm0032Bl._xGm0107)
                        Rectangle().fill(_xGm0074 == p ? _XGm0032Bl._xGm0108 : .clear).frame(height: 2)
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 24).padding(.top, 8)
    }

    @ViewBuilder
    private var _xGm0079: some View {
        if _xGm0077.isEmpty {
            Spacer()
            _XGm0029Bl(
                _xGm0123: _xGm0074 == ._xPm0001 ? "square.grid.2x2" : "mappin.and.ellipse",
                _xGm0046: _xGm0074 == ._xPm0001 ? "Your gallery is bare" : "No visits planned",
                _xGm0124: "Open any work and add it to build your private collection."
            )
            Spacer()
        } else {
            ScrollView {
                LazyVGrid(columns: _xGm0076, spacing: 2) {
                    ForEach(Array(_xGm0077.enumerated()), id: \.element.id) { idx, frame in
                        Button { _xGm0075 = idx } label: {
                            _XGm0025Bl(_xGm0010: frame._xGm0010)
                        }.buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 2).padding(.bottom, 20)
            }
        }
    }
}

private struct _XGm0024Bl: Identifiable { let _xGm0080: Int; var id: Int { _xGm0080 } }
