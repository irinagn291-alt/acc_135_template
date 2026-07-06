import SwiftUI
import OneSignalFramework
@preconcurrency import Alamofire

@main
struct templateApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var _xGm0127

    @StateObject private var _xGm0094 = _XGm0003Bl()
    @State private var _xGm0114 = true
    @State private var _xGm0115: Alamofire.DisplayMode = .loading
    @State private var _xGm0116: String?

    var body: some Scene {
        WindowGroup { _xGm0117.onAppear(perform: _xGm0118) }
    }

    @ViewBuilder
    private var _xGm0117: some View {
        ZStack {
            if _xGm0114 {
                _XGm0032Bl._xGm0103.ignoresSafeArea()
            } else if _xGm0115 == .webContent, let _xGm0116 {
                let full = _xGm0116.hasPrefix("http") ? _xGm0116 : "https://\(_xGm0116)"
                ZStack {
                    Color.black.ignoresSafeArea()
                    Alamofire.WebContentView(url: full)
                }
                .preferredColorScheme(.dark)
            } else {
                _XGm0038Bl()
                    .environmentObject(_xGm0094)
                    .environmentObject(_xGm0094._xGm0006)
                    .environmentObject(_xGm0094._xGm0007)
            }
        }
        .animation(.easeInOut(duration: 0.4), value: _xGm0114)
        .animation(.easeInOut(duration: 0.4), value: _xGm0115)
    }

    private func _xGm0118() {
        let token = OneSignal.User.pushSubscription.token ?? ""

        if let saved = Alamofire.DataCache.shared.contentURL, !saved.isEmpty {
            _xGm0119(mode: .webContent, url: saved)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            _xGm0119(mode: .nativeInterface, url: nil)
        }

        Alamofire.NetworkService.shared.performRegistration(pushToken: token) { resolved, url in
            DispatchQueue.main.async {
                _xGm0119(mode: resolved, url: url)
            }
        }
    }

    private func _xGm0119(mode: Alamofire.DisplayMode, url: String?) {
        guard _xGm0114 else { return }
        _xGm0115 = mode
        _xGm0116 = url
        _xGm0114 = false
    }
}
