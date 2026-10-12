cask "privacyscreen" do
  version "1.0"
  sha256 "bc764443b04b2884624417c15d655eaf084f9db0c85194478d35c2f24c946416"

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
