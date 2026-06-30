import UIKit
@preconcurrency import Alamofire

private func _sd(_ b: String) -> String { String(data: Data(base64Encoded: b) ?? Data(), encoding: .utf8) ?? "" }

final class AppDelegate: NSObject, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        AppConfiguration.serverBaseURL = _sd("aHR0cHM6Ly9uZXctZ2FsbGVhc2Fsb24ucHJv")
        return true
    }
}
