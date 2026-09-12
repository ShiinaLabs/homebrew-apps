cask "kipless" do
  version "1.1.0"
  sha256 "f368e6e752783b4edc723d8fa5fab37eeba1a60a860a2bc15866c9482bcd18c6"

  url "https://github.com/ShiinaLabs/Kipless/releases/download/v#{version}/Kipless.dmg"
  name "Kipless"
  desc "Lightweight utility for controlling system and display sleep"
  homepage "https://github.com/ShiinaLabs/Kipless"

  depends_on macos: :sonoma

  app "Kipless.app"
end
