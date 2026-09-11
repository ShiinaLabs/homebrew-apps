cask "kipless" do
  version "1.0.0"
  sha256 "9e23588b61c866c90b8a6ae86e417713d3139e5118f8c02ecd0bbe5c16ef4cf9"

  url "https://github.com/ShiinaLabs/Kipless/releases/download/v#{version}/Kipless.dmg"
  name "Kipless"
  desc "Lightweight utility for controlling system and display sleep"
  homepage "https://github.com/ShiinaLabs/Kipless"

  depends_on macos: :sonoma

  app "Kipless.app"
end
