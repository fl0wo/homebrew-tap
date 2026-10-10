cask "fyolo" do
  version "0.1.1"
  sha256 "11619a04945018d4d30e41d18f281107e178d10251f2bb5978e0643e10be98f9"

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
