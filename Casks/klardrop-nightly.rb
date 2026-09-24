# TEMPLATE for the rolling nightly cask. The nightly workflow (release-nightly.yml)
# renders 1.0.0-nightly.850 (full pre-release semver, so `brew upgrade` sees each new build),
# d39f89665aaa70f9806516986d29dd7122f53600fe70acb0c4ac0d10ba34613e (the published DMG's checksum) and klardrop-1.0.0.dmg (the version-stamped DMG filename),
# then pushes the result to the tap as Casks/klardrop-nightly.rb.
#
# Install:  brew install --cask carlonzo/klardrop/klardrop-nightly
#
# Separate token from the stable `klardrop` cask so a tester can track nightly without
# clobbering a stable install. ponytail: assumes the nightly DMG is notarized (Apple
# secrets present) — an unsigned nightly installs but Gatekeeper blocks first launch.

cask "klardrop-nightly" do
  version "1.0.0-nightly.850"
  sha256 "d39f89665aaa70f9806516986d29dd7122f53600fe70acb0c4ac0d10ba34613e"

  url "https://github.com/carlonzo/klardrop/releases/download/nightly/klardrop-1.0.0.dmg",
      verified: "github.com/carlonzo/klardrop/"
  name "Klardrop (nightly)"
  desc "Nightly tester build of Klardrop — share files and clipboard with nearby devices"
  homepage "https://github.com/carlonzo/klardrop"

  app "Klardrop.app"

  conflicts_with cask: "klardrop"

  zap trash: [
    "~/Library/Application Support/com.carlom.Klardrop",
    "~/Library/Application Support/klardrop",
    "~/Library/Caches/com.carlom.Klardrop",
    "~/Library/Preferences/com.carlom.Klardrop.plist",
    "~/Library/Saved Application State/com.carlom.Klardrop.savedState",
    "~/Library/Logs/klardrop",
    "~/.klardrop",
  ]
end
