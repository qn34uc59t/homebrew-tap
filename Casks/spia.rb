cask "spia" do
  version "0.1.4"
  sha256 "bd4511503042e42a6b745aacd9079c2b8849adbbd2dcae0caee2751f9ca7dbe8"

  url "https://github.com/qn34uc59t/spia/releases/download/v#{version}/SPIA-v#{version}.dmg"
  name "SPIA"
  desc "Intelligent camera motion surveillance and alert dispatch for macOS"
  homepage "https://github.com/qn34uc59t/spia"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "SPIA.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/SPIA.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/SPIA",
    "~/Library/Application Support/com.spia.app",
    "~/Library/Caches/com.spia.app",
    "~/Library/Preferences/com.spia.app.plist",
  ]
end
