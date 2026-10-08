# Homebrew Cask for Shadowtype.
#
# Lives in the personal tap dario-valles/homebrew-shadowtype, which has NO
# star/notability gate — unlike submitting to homebrew/homebrew-cask, which
# requires the app repo to clear 75+ stars first.
#
# Artifact is the notarized DMG attached to the GitHub Release (stable public
# URL). Shadowtype also self-updates in-app from the release's signed
# latest.json, so `auto_updates true`.
#
# On a new release, bump `version` and `sha256` (scripts/release.sh does this
# when TAP_REPO/TAP_DIR are set):
#   shasum -a 256 Shadowtype.dmg

cask "shadowtype" do
  version "0.6.1"
  sha256 "c91b3188a3d67fad11bf26dc92c9b89b040c5c68758b8cf2deb29ef037a9552d"

  url "https://github.com/dario-valles/shadowtype/releases/download/v#{version}/Shadowtype.dmg",
      verified: "github.com/dario-valles/shadowtype/"
  name "Shadowtype"
  desc "Private, on-device AI autocomplete"
  homepage "https://shadowtype.app/"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Shadowtype.app"

  zap trash: [
    "~/Library/Application Support/Shadowtype",
    "~/Library/Caches/com.shadowtype.app",
    "~/Library/Preferences/com.shadowtype.app.plist",
  ]
end
