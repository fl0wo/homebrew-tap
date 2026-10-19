cask "fyolo" do
  version "0.16.0"
  sha256 "bd0400b3d23ec4af0007bdd3df831af552a72b51b32aefad130941306fcba865"

  url "https://github.com/fl0wo/fyolo/releases/download/v#{version}/fyolo.dmg"
  name "fyolo"
  desc "Terminal-first agentic development environment"
  homepage "https://fyolo.sh/"

  depends_on macos: :sonoma

  app "fyolo.app"

  # The app is ad-hoc signed, not notarized, so clear the quarantine flag or
  # Gatekeeper refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/fyolo.app"]
  end

  zap trash: "~/.fyolo"
end
