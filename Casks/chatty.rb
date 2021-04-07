cask "chatty" do
  version "0.13.1_mac44"
  sha256 "dec2fd80010a48f9b25814547fbccf29f969f3a287f71b6228a0685a776e37e9"

  url "https://github.com/dehesselle/chatty/releases/download/v#{version}/Chatty_v#{version}.dmg"
  appcast "https://github.com/dehesselle/chatty/releases.atom"
  name "Chatty"
  desc "Twitch Chat Client for Desktop"
  homepage "https://github.com/dehesselle/chatty"

  app "Chatty.app"
end
