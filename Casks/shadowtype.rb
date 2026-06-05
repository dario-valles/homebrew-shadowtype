# Homebrew Cask for Shadowtype.
#
# Lives in the personal tap dario-valles/homebrew-shadowtype, which has NO
# star/notability gate — unlike submitting to homebrew/homebrew-cask, which
# requires the app repo to clear 75+ stars first.
#
# Artifact is the GitHub Release asset (stable public URL). Shadowtype also
# self-updates in-app from dl.shadowtype.app, so `auto_updates true`.
#
# On a new release, bump `version` and `sha256`:
#   shasum -a 256 Shadowtype-<version>.zip

cask "shadowtype" do
  version "0.2.1"
  sha256 "1c35f78843e0e255462ccf2778476691e127bfd0fdc2fd3d3776b67c1153e736"

  url "https://github.com/dario-valles/shadowtype-mac/releases/download/v#{version}/Shadowtype-#{version}.zip",
      verified: "github.com/dario-valles/shadowtype-mac/"
  name "Shadowtype"
  desc "Private, on-device AI autocomplete for macOS"
  homepage "https://shadowtype.app/"

  auto_updates true
  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Shadowtype.app"

  zap trash: [
    "~/Library/Application Support/Shadowtype",
    "~/Library/Caches/app.shadowtype",
    "~/Library/Preferences/app.shadowtype.plist",
  ]
end
