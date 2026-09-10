cask "wifi-lens" do
  version "1.6.0"
  sha256 "0ec44f5fb2d391b5161a96b33191540f5789a9156ce9b757b6dc4e16b84130cb"

  url "https://github.com/SHIINASAMA/wifi-lens/releases/download/v#{version}/WiFiLens.dmg"
  name "WiFi Lens"
  desc "Native Wi-Fi analysis and network diagnostics"
  homepage "https://wifi-lens.shiinalabs.com/"

  auto_updates true
  depends_on macos: :sonoma

  app "WiFi Lens.app"
end
