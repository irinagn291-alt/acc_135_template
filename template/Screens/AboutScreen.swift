import SwiftUI
import StoreKit
import WebKit

private func _sd(_ b: String) -> String { String(data: Data(base64Encoded: b) ?? Data(), encoding: .utf8) ?? "" }

struct _XGm0012Bl: View {
    @EnvironmentObject private var _xGm0006: _XGm0031Bl
    @Environment(\.requestReview) private var requestReview
    @State private var _xGm0045: _XGm0013Bl?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 28) {
                _xGm0046
                _xGm0047
                _xGm0048
                _xGm0049
            }
            .padding(.horizontal, 24).padding(.bottom, 36)
        }
        .background(_XGm0032Bl._xGm0103.ignoresSafeArea())
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $_xGm0045) { l in _XGm0014Bl(_xGm0017: l._xGm0017, _xGm0052: l._xGm0052) }
    }

    private var _xGm0046: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("GALLEA").font(_XGm0033Bl._xGm0008(13)).tracking(4).foregroundStyle(_XGm0032Bl._xGm0107)
            Text("A pocket gallery").font(_XGm0033Bl._xGm0112(30)).foregroundStyle(_XGm0032Bl._xGm0106)
            Text("Version 1.0").font(_XGm0033Bl._xGm0027(13)).foregroundStyle(_XGm0032Bl._xGm0107)
        }
        .padding(.top, 10)
    }

    private var _xGm0047: some View {
        HStack(spacing: 0) {
            _xGm0050("\(_xGm0006._xGm0126(._xPm0001).count)", "Collected")
            Rectangle().fill(_XGm0032Bl._xGm0110).frame(width: 1, height: 40)
            _xGm0050("\(_xGm0006._xGm0126(._xPm0002).count)", "To visit")
            Rectangle().fill(_XGm0032Bl._xGm0110).frame(width: 1, height: 40)
            _xGm0050("\(_xGm0006._xGm0125.filter { $0._xGm0012 }.count)", "Adored")
        }
        .overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0110, lineWidth: 1))
    }
    private func _xGm0050(_ v: String, _ l: String) -> some View {
        VStack(spacing: 4) {
            Text(v).font(_XGm0033Bl._xGm0112(24)).foregroundStyle(_XGm0032Bl._xGm0106)
            Text(l).font(_XGm0033Bl._xGm0008(10)).tracking(1).foregroundStyle(_XGm0032Bl._xGm0107)
        }
        .frame(maxWidth: .infinity).padding(.vertical, 18)
    }

    private var _xGm0048: some View {
        VStack(spacing: 0) {
            _xGm0051("Contact") { _xGm0045 = ._xPm0017 }
            Rectangle().fill(_XGm0032Bl._xGm0110).frame(height: 1)
            _xGm0051("Rate Gallea") { requestReview() }
        }
        .overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0110, lineWidth: 1))
    }
    private func _xGm0051(_ t: String, _ a: @escaping () -> Void) -> some View {
        Button(action: a) {
            HStack {
                Text(t).font(_XGm0033Bl._xGm0027(16)).foregroundStyle(_XGm0032Bl._xGm0106)
                Spacer()
                Image(systemName: "arrow.up.right").font(.system(size: 12, weight: .semibold)).foregroundStyle(_XGm0032Bl._xGm0107)
            }
            .padding(.horizontal, 18).padding(.vertical, 16)
        }
    }

    private var _xGm0049: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Artworks and images are provided by The Metropolitan Museum of Art's open API and shown under its terms.")
                .font(_XGm0033Bl._xGm0027(13)).foregroundStyle(_XGm0032Bl._xGm0107).lineSpacing(3)
            Link(destination: URL(string: "https://www.metmuseum.org")!) {
                HStack(spacing: 4) {
                    Text("The Metropolitan Museum of Art").font(_XGm0033Bl._xGm0008(13))
                    Image(systemName: "arrow.up.right").font(.system(size: 11, weight: .bold))
                }
                .foregroundStyle(_XGm0032Bl._xGm0108)
            }
        }
    }
}

private enum _XGm0013Bl: Identifiable {
    case _xPm0017
    var id: String { _xGm0017 }
    var _xGm0017: String { "Contact" }
    var _xGm0052: String { _sd("aHR0cHM6Ly9uZXctZ2FsbGVhc2Fsb24ucHJvL2NvbnRhY3QtdXM=") }
}

struct _XGm0014Bl: View {
    let _xGm0017: String
    let _xGm0052: String
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            _XGm0036Bl(_xGm0052: _xGm0052).ignoresSafeArea(edges: .bottom)
                .navigationTitle(_xGm0017).navigationBarTitleDisplayMode(.inline)
                .toolbar { ToolbarItem(placement: .cancellationAction) { Button("Done") { dismiss() } } }
        }.tint(_XGm0032Bl._xGm0106)
    }
    private struct _XGm0036Bl: UIViewRepresentable {
        let _xGm0052: String
        func makeUIView(context: Context) -> WKWebView {
            let v = WKWebView()
            if let u = URL(string: _xGm0052) { v.load(URLRequest(url: u)) }
            return v
        }
        func updateUIView(_ v: WKWebView, context: Context) {}
    }
}
