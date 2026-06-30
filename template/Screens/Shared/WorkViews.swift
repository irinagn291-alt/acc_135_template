import SwiftUI

struct _XGm0025Bl: View {
    let _xGm0010: _XGm0006Bl

    var body: some View {
        _XGm0027Bl(_xGm0082: _xGm0010._xGm0025(), _xGm0083: .fill)
            .frame(maxWidth: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .clipped()
            .background(_XGm0032Bl._xGm0105)
    }
}

struct _XGm0026Bl: View {
    let _xGm0010: _XGm0006Bl
    var _xGm0081: Bool = true

    var body: some View {
        _XGm0027Bl(_xGm0082: _xGm0010._xGm0025(large: _xGm0081), _xGm0083: .fit)
    }
}

private struct _XGm0027Bl: View {
    let _xGm0082: URL?
    let _xGm0083: ContentMode

    var body: some View {
        Group {
            if let _xGm0082 {
                AsyncImage(url: _xGm0082) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable().aspectRatio(contentMode: _xGm0083)
                    case .failure:
                        _xGm0084
                    default:
                        ZStack { _XGm0032Bl._xGm0105; ProgressView().tint(_XGm0032Bl._xGm0107) }
                    }
                }
            } else {
                _xGm0084
            }
        }
    }

    private var _xGm0084: some View {
        ZStack {
            _XGm0032Bl._xGm0105
            Image(systemName: "photo.artframe").font(.system(size: 28)).foregroundStyle(_XGm0032Bl._xGm0109)
        }
    }
}

struct _XGm0028Bl: View {
    let _xGm0010: _XGm0006Bl
    var _xGm0085: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            _XGm0026Bl(_xGm0010: _xGm0010, _xGm0081: false)
                .frame(maxWidth: .infinity)
                .frame(maxHeight: 260)
                .clipped()
                .background(_XGm0032Bl._xGm0105)
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(_xGm0010._xGm0017).font(_XGm0033Bl._xGm0017(18)).foregroundStyle(_XGm0032Bl._xGm0106).lineLimit(2)
                    Text(_xGm0010._xGm0027).font(_XGm0033Bl._xGm0027(13)).foregroundStyle(_XGm0032Bl._xGm0107).lineLimit(1)
                }
                Spacer()
                if _xGm0085 { Rectangle().fill(_XGm0032Bl._xGm0108).frame(width: 10, height: 10).padding(.top, 6) }
            }
            .padding(.top, 12)
        }
    }
}

struct _XGm0029Bl: View {
    let _xGm0123: String
    let _xGm0046: String
    let _xGm0124: String
    var body: some View {
        VStack(spacing: 14) {
            Image(systemName: _xGm0123).font(.system(size: 38, weight: .light)).foregroundStyle(_XGm0032Bl._xGm0109)
            Text(_xGm0046).font(_XGm0033Bl._xGm0017(20)).foregroundStyle(_XGm0032Bl._xGm0106)
            Text(_xGm0124).font(_XGm0033Bl._xGm0027(14)).foregroundStyle(_XGm0032Bl._xGm0107)
                .multilineTextAlignment(.center).padding(.horizontal, 44)
        }
        .frame(maxWidth: .infinity).padding(.vertical, 44)
    }
}
