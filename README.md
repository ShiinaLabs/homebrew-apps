# ShiinaLabs Homebrew Apps

Homebrew Casks for public ShiinaLabs applications.

## Install WiFi Lens

~~~sh
brew tap ShiinaLabs/apps
brew install --cask ShiinaLabs/apps/wifi-lens
~~~

WiFi Lens is installed from the signed and notarized DMG published by the
SHIINASAMA/wifi-lens GitHub repository. Sparkle remains available for the
installed OSS app, while Homebrew can also manage explicit Cask upgrades.

Each additional ShiinaLabs app gets one Cask file under Casks/.

## Update

~~~sh
brew update
brew upgrade --cask ShiinaLabs/apps/wifi-lens
~~~
