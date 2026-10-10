cask "fyolo" do
  version "0.2.0"
  sha256 "cb09708d4b9bc1f2fefebef081469611777d2339e3d1fe8366f2b9ddbe59498e"

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
