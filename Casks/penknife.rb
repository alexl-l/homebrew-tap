cask "penknife" do
  version "1.6"
  sha256 "48b3e361f2bb715fd6194da2c30b7091340af61ff8b9183576f9d116d4232e48"

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
