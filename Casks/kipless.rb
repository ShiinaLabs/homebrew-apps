cask "kipless" do
  version "1.2.1"
  sha256 "b860bbb2d0fea56006f7850be366dee9b44a3965d3644906cd5dd8384511321e"

  url "https://github.com/ShiinaLabs/Kipless/releases/download/v#{version}/Kipless.dmg"
  name "Kipless"
  desc "Lightweight utility for controlling system and display sleep"
  homepage "https://github.com/ShiinaLabs/Kipless"

  # Kipless updates itself through Sparkle. Without this Homebrew would keep
  # offering its own upgrade of an app that has already moved on, so the Cask
  # installs and the app updates — the same arrangement WiFi Lens uses here.
  auto_updates true
  depends_on macos: :sonoma

  app "Kipless.app"
end
