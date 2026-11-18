cask "penknife" do
  version "1.7"
  sha256 "8535596478ba713ca2af3a219ff6020a501ef4d3d1990213e91ddb6642cb85d1"

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
  EOS
end
