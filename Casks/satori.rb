cask "satori" do
  version "1.3.3"
  sha256 "f5089bb840c82db463e4d64e46a6b71021a9904e8f1bfa4ffdb6e7968f4e3923"

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
