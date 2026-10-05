cask "satori" do
  version "1.4.0"
  sha256 "ba3a2f0ba733f7c11538819405f019b16e3de2dce79e3505391f70fc5d278ddb"

  url "https://github.com/emcee5000/satori/releases/download/v#{version}/Satori.zip"
  name "Satori"
  desc "Keyboard-first Getting Things Done (GTD) app"
  homepage "https://satorigtd.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Satori.app"

  zap trash: [
    "~/Library/Application Support/Satori",
    "~/Library/Preferences/io.github.emcee5000.satori.plist",
  ]

  caveats <<~EOS
    Satori isn't notarized yet. The first time you open it, macOS can't verify
    the developer: go to System Settings → Privacy & Security and click
    "Open Anyway". You only need to do this once.
  EOS
end
