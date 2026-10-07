cask "wifi-lens" do
  version "2.0.0"
  sha256 "bb92e2ee5173dcf8b90fab0d2054aebd66ae5db1375502d639d9683428833d95"

  url "https://github.com/SHIINASAMA/wifi-lens/releases/download/v#{version}/WiFiLens.dmg"
  name "WiFi Lens"
  desc "Native Wi-Fi analysis and network diagnostics"
  homepage "https://wifi-lens.shiinalabs.com/"

  auto_updates true
  depends_on macos: :sonoma

  app "WiFi Lens.app"
end
