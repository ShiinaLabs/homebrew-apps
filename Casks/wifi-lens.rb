cask "wifi-lens" do
  version "2.1.0"
  sha256 "cb17f1666eb437d43effa06a24b34c2eea94edae102b995754cf389078c3f5e3"

  url "https://github.com/SHIINASAMA/wifi-lens/releases/download/v#{version}/WiFiLens.dmg"
  name "WiFi Lens"
  desc "Native Wi-Fi analysis and network diagnostics"
  homepage "https://wifi-lens.shiinalabs.com/"

  auto_updates true
  depends_on macos: :sonoma

  app "WiFi Lens.app"
end
