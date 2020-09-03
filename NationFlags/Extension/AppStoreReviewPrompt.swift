import StoreKit

struct AppStoreReviewPrompt {
  // 1.
  static let minimumActionCount = 15

  static func requestReviewIfAppropriate() {
    let defaults = UserDefaults.standard
    let bundle = Bundle.main

    // 2.
    var actionCount = defaults.integer(forKey: "ActionCount")

    // 3.
    actionCount += 1

    // 4.
    defaults.set(actionCount, forKey: "ActionCount")

    // 5.
    guard actionCount >= minimumActionCount else {
      return
    }

    // 6.
    let bundleVersionKey = kCFBundleVersionKey as String
    let currentVersion = bundle.object(forInfoDictionaryKey: bundleVersionKey) as? String
    let lastVersion = defaults.string(forKey: "lastReviewRequestAppVersion")

    // 7.
    guard lastVersion == nil || lastVersion != currentVersion else {
      return
    }

    // 8.
    SKStoreReviewController.requestReview()

    // 9.
    defaults.set(0, forKey: "ActionCount")
    defaults.set(currentVersion, forKey: "lastReviewRequestAppVersion")
  }
}
