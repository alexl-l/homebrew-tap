cask "penknife" do
  version "1.20"
  sha256 "a21362e02331391f08ce4d303bec9a8a10dccce03675360d002d413902424454"

  url "https://github.com/alexl-l/penknife/releases/download/v#{version}/Penknife-#{version}.zip"
  name "Penknife"
  desc "Menu bar app: meeting-aware mic mute, clipboard history and screenshot editor"
  homepage "https://alexl-l.github.io/penknife/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Penknife.app"

  zap trash: [
    "~/Library/Application Support/Penknife",
    "~/Library/Caches/io.github.alexl-l.Penknife",
    "~/Library/HTTPStorages/io.github.alexl-l.Penknife",
    "~/Library/Preferences/io.github.alexl-l.Penknife.plist",
  ]

  caveats <<~EOS
    Penknife is not notarized by Apple. The first time, open it once, then go to
    System Settings → Privacy & Security and click "Open Anyway".
    Later versions update from the app (menu → Check for Updates…).

    No "Open Anyway", or the warning keeps coming back? On Macs managed by a
    company or school a profile may block apps that aren't notarized. Remove the
    "downloaded from the internet" mark and open Penknife again (on a work Mac,
    check with your IT team first):
      xattr -dr com.apple.quarantine /Applications/Penknife.app
  EOS
end
