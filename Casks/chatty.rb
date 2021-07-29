cask "chatty" do
  version "0.14_mac45"

  if Hardware::CPU.intel?
    sha256 "7d021002ae5088ae660b11b9621687921bd7de93a955b71718f26c93924db7e4"
    url "https://github.com/dehesselle/chatty/releases/download/v#{version}/Chatty_v#{version}_x64.dmg"
  else
    url "https://github.com/dehesselle/chatty/releases/download/v#{version}/Chatty_v#{version}_arm64.dmg"
    sha256 "7d021002ae5088ae660b11b9621687921bd7de93a955b71718f26c93924db7e4"
  end

  name "Chatty"
  desc "Twitch Chat Client for Desktop"
  homepage "https://github.com/dehesselle/chatty"

  livecheck do
    url "https://github.com/dehesselle/chatty/releases"
    strategy :page_match
    regex(%r{href=.*?/Chatty_v(\d+(?:\.\d+)+_mac\d+)_arm64\.dmg}i)
  end

  app "Chatty.app"
end
