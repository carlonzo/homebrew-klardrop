# TEMPLATE for the rolling nightly cask. The nightly workflow (release-nightly.yml)
# renders 1.0.0-nightly.935 (full pre-release semver, so `brew upgrade` sees each new build),
# 4da2f0f9f3ca807aad2b01d46598047c2a8a97e728f46c4763014c4addd28033 (the published DMG's checksum) and klardrop-1.0.0.dmg (the version-stamped DMG filename),
# then pushes the result to the tap as Casks/klardrop-nightly.rb.
#
# Install:  brew install --cask carlonzo/klardrop/klardrop-nightly
#
# Separate token from the stable `klardrop` cask so a tester can track nightly without
# clobbering a stable install. ponytail: assumes the nightly DMG is notarized (Apple
# secrets present) — an unsigned nightly installs but Gatekeeper blocks first launch.

cask "klardrop-nightly" do
  version "1.0.0-nightly.935"
  sha256 "4da2f0f9f3ca807aad2b01d46598047c2a8a97e728f46c4763014c4addd28033"

  url "https://github.com/carlonzo/klardrop/releases/download/nightly/klardrop-1.0.0.dmg"
  name "Klardrop (nightly)"
  desc "Nightly tester build of Klardrop — share files and clipboard with nearby devices"
  homepage "https://github.com/carlonzo/klardrop"

  depends_on macos: ">= :sequoia"

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
