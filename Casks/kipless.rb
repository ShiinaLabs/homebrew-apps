cask "kipless" do
  version "1.2.0"
  sha256 "3266694a22e3a3d36fa8b9781077610965b9c083d48535164a159a6fd36b3e77"

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
