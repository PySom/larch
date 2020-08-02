import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)


    GMSServices.provideAPIKey("AIzaSyBxrgf0Z5-H0PMJi2Ki9XpxfZczSkmZ5G4")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
