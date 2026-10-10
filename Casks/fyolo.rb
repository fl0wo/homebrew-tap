cask "fyolo" do
  version "0.1.0"
  sha256 "469f99d63799c89031b1e4c9880c397af0b08c8c322268aed9946c3b5e9cfe30"

  url "https://github.com/fl0wo/fyolo/releases/download/v#{version}/fyolo.dmg"
  name "fyolo"
  desc "Terminal-first agentic development environment"
  homepage "https://fyolo.sh"

  depends_on macos: ">= :sonoma"

  app "fyolo.app"

  # The app is ad-hoc signed, not notarized, so clear the quarantine flag or
  # Gatekeeper refuses to open it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/fyolo.app"]
  end

  zap trash: "~/.fyolo"
end
