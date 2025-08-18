import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

  override func applicationDidFinishLaunching(_ notification: Notification) {
    guard let window = NSApplication.shared.windows.first else {
      return
    }
    window.setContentSize(NSSize(width: 1280, height: 720)) // 设置初始大小
    window.minSize = NSSize(width: 640, height: 480)        // 最小尺寸
    // window?.maxSize = NSSize(width: 1200, height: 900)       // 最大尺寸（可选）
    window.setFrameOrigin(NSPoint(x: 50, y: NSScreen.main?.frame.height ?? 1080 - (window.frame.height - 50)))
  }
}
