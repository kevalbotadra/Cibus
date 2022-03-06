import UIKit
import Flutter
import GoogleMaps  // Add this import


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    GMSServices.provideAPIKey("AIzaSyCWO3h1pl8nk1tq9SCl_PWwtZOsEhlhMfs")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
