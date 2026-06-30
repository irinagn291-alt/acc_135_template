import SwiftUI

struct _XGm0030Bl: View {
    let _xGm0010: _XGm0006Bl

    @EnvironmentObject private var _xGm0094: _XGm0003Bl
    @EnvironmentObject private var _xGm0006: _XGm0031Bl
    @State private var _xGm0086: _XGm0006Bl?

    private var _xGm0087: _XGm0006Bl { _xGm0086 ?? _xGm0010 }
    private var _xGm0088: _XGm0005Bl? { _xGm0006._xGm0125.first { $0._xGm0010._xGm0016 == _xGm0010._xGm0016 } }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                _XGm0026Bl(_xGm0010: _xGm0087)
                    .frame(maxWidth: .infinity)
                    .background(_XGm0032Bl._xGm0105)
                _xGm0008
                _xGm0089
                if let f = _xGm0088 { _xGm0091(f) }
                if let medium = _xGm0087._xGm0022 { _xGm0092("Medium", medium) }
                if let dept = _xGm0087._xGm0023 { _xGm0092("Department", dept) }
                if let blurb = _xGm0087._xGm0024 { _xGm0093(blurb) }
            }
            .padding(.horizontal, 24).padding(.bottom, 36)
        }
        .background(_XGm0032Bl._xGm0103.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        .task { if _xGm0086 == nil { _xGm0086 = try? await _xGm0094._xGm0005._xGm0059(_xGm0010._xGm0016) } }
    }

    private var _xGm0008: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(_xGm0087._xGm0017).font(_XGm0033Bl._xGm0112(28)).foregroundStyle(_XGm0032Bl._xGm0106)
            Text(_xGm0087._xGm0026).font(_XGm0033Bl._xGm0027(15)).foregroundStyle(_XGm0032Bl._xGm0106)
            if let d = _xGm0087._xGm0019 { Text(d).font(_XGm0033Bl._xGm0027(14)).foregroundStyle(_XGm0032Bl._xGm0107) }
            Rectangle().fill(_XGm0032Bl._xGm0108).frame(width: 40, height: 2).padding(.top, 4)
        }
    }

    private var _xGm0089: some View {
        HStack(spacing: 0) {
            _xGm0090("My gallery", _xGm0088?._xGm0011 == ._xPm0001) { _xGm0006._xGm0098(_xGm0087, at: ._xPm0001) }
            Rectangle().fill(_XGm0032Bl._xGm0106).frame(width: 1)
            _xGm0090("To visit", _xGm0088?._xGm0011 == ._xPm0002) { _xGm0006._xGm0098(_xGm0087, at: ._xPm0002) }
            if _xGm0088 != nil {
                Rectangle().fill(_XGm0032Bl._xGm0106).frame(width: 1)
                Button { _xGm0006._xGm0099(ref: _xGm0010._xGm0016) } label: {
                    Image(systemName: "trash").foregroundStyle(_XGm0032Bl._xGm0106).frame(width: 52, height: 50)
                }
            }
        }
        .overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0106, lineWidth: 1))
    }
    private func _xGm0090(_ label: String, _ on: Bool, _ a: @escaping () -> Void) -> some View {
        Button(action: a) {
            Text(label).font(_XGm0033Bl._xGm0008(14)).foregroundStyle(on ? _XGm0032Bl._xGm0103 : _XGm0032Bl._xGm0106)
                .frame(maxWidth: .infinity).frame(height: 50)
                .background(on ? _XGm0032Bl._xGm0106 : Color.clear)
        }
    }

    private func _xGm0091(_ f: _XGm0005Bl) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("MY LABEL").font(_XGm0033Bl._xGm0008(11)).tracking(2).foregroundStyle(_XGm0032Bl._xGm0107)
                Spacer()
                Button { _xGm0006._xGm0100(ref: _xGm0010._xGm0016) { $0._xGm0012.toggle() } } label: {
                    Image(systemName: f._xGm0012 ? "heart.fill" : "heart")
                        .foregroundStyle(f._xGm0012 ? _XGm0032Bl._xGm0108 : _XGm0032Bl._xGm0107)
                }
            }
            Toggle("Seen in person", isOn: Binding(
                get: { f._xGm0013 },
                set: { v in _xGm0006._xGm0100(ref: _xGm0010._xGm0016) { $0._xGm0013 = v } }
            ))
            .font(_XGm0033Bl._xGm0027(15)).tint(_XGm0032Bl._xGm0108)
            TextField("", text: Binding(
                get: { f._xGm0014 },
                set: { t in _xGm0006._xGm0100(ref: _xGm0010._xGm0016) { $0._xGm0014 = t } }
            ), prompt: Text("A note for yourself…").foregroundStyle(_XGm0032Bl._xGm0109), axis: .vertical)
            .font(_XGm0033Bl._xGm0027(14)).foregroundStyle(_XGm0032Bl._xGm0106).lineLimit(2...5)
            .padding(12).overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0110, lineWidth: 1))
        }
        .padding(16)
        .overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0110, lineWidth: 1))
    }

    private func _xGm0092(_ title: String, _ value: String) -> some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(title.uppercased()).font(_XGm0033Bl._xGm0008(11)).tracking(1.5).foregroundStyle(_XGm0032Bl._xGm0107)
            Text(value).font(_XGm0033Bl._xGm0027(15)).foregroundStyle(_XGm0032Bl._xGm0106)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func _xGm0093(_ text: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("ABOUT THIS WORK").font(_XGm0033Bl._xGm0008(11)).tracking(2).foregroundStyle(_XGm0032Bl._xGm0107)
            Text(text).font(_XGm0033Bl._xGm0027(15)).foregroundStyle(_XGm0032Bl._xGm0106.opacity(0.85)).lineSpacing(5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
