cask "wifi-lens" do
  version "2.0.1"
  sha256 "c3b2fc8bf53f97cbf87b096da00a85ffdc5eb650f06f674dcb457d5003569399"

  url "https://github.com/SHIINASAMA/wifi-lens/releases/download/v#{version}/WiFiLens.dmg"
  name "WiFi Lens"
  desc "Native Wi-Fi analysis and network diagnostics"
  homepage "https://wifi-lens.shiinalabs.com/"

  auto_updates true
  depends_on macos: :sonoma

  app "WiFi Lens.app"
end
