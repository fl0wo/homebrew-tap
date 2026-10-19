cask "fyolo" do
  version "0.17.1"
  sha256 "de749f60832d22877f04fb82e6ee083b5f4140fdcbf7900399e0073489246895"

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
