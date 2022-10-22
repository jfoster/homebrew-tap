cask "speedyloader" do
  version "1.5.1"
  sha256 "b16a11a5caa425791d87c81f07b82dd41da278a815b5c28e7cdc9d0304b9a65a"

  url "https://github.com/speeduino/SpeedyLoader/releases/download/v#{version}/SpeedyLoader.dmg"
  name "speedyloader"
  desc "Firmware loader for Speeduino devices"
  homepage "https://github.com/speeduino/SpeedyLoader"

  livecheck do
    url "https://github.com/speeduino/SpeedyLoader/releases"
    strategy :github_latest
  end

  app "SpeedyLoader.app"
end
