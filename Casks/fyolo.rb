cask "fyolo" do
  version "0.11.0"
  sha256 "184334c4fff5fb56495dac30a6cc03bb9a4262d1a142cc25e4ef0b57d496bc94"

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
