cask "chatty" do
  version "0.13.1,43"
  sha256 "dec2fd80010a48f9b25814547fbccf29f969f3a287f71b6228a0685a776e37e9"

  url "https://github.com/dehesselle/chatty/releases/download/v#{version.before_comma}_mac#{version.after_comma}/Chatty_v#{version.before_comma}_b#{version.after_comma}.dmg"
  appcast "https://github.com/dehesselle/chatty/releases.atom"
  name "Chatty"
  desc "A Twitch Chat Client for Desktop"
  homepage "https://github.com/dehesselle/chatty"

  app "Chatty.app"
end
