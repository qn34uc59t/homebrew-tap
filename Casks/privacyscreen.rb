cask "privacyscreen" do
  version "1.0.1"
  sha256 "d8581b62b3f3a9ff7c672ac48252a4162d85fd0e1f51b4636e41ff8b9d410b7d"

  url "https://github.com/qn34uc59t/privacy_screen/releases/download/v#{version}/PrivacyScreen-v#{version}.dmg"
  name "PrivacyScreen"
  desc "Intelligent head-tracking privacy shield using CoreMotion and AirPods"
  homepage "https://github.com/qn34uc59t/privacy_screen"

  depends_on macos: ">= :sonoma"

  app "PrivacyScreen.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/PrivacyScreen.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Scripts/com.nvzhn.PrivacyScreen",
    "~/Library/Containers/com.nvzhn.PrivacyScreen",
    "~/Library/Preferences/com.nvzhn.PrivacyScreen.plist",
  ]
end
