cask "chatty" do
  version "0.14_mac45"
  sha256 "7d021002ae5088ae660b11b9621687921bd7de93a955b71718f26c93924db7e4"

  url "https://github.com/dehesselle/chatty/releases/download/v#{version}/Chatty_v#{version}.dmg"
  appcast "https://github.com/dehesselle/chatty/releases.atom"
  name "Chatty"
  desc "Twitch Chat Client for Desktop"
  homepage "https://github.com/dehesselle/chatty"

  app "Chatty.app"
end
