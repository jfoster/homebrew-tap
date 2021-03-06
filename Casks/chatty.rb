cask "chatty" do
  if Hardware::CPU.intel?
    version "0.14_mac45"
    sha256 "7d021002ae5088ae660b11b9621687921bd7de93a955b71718f26c93924db7e4"
    url "https://github.com/dehesselle/chatty/releases/download/v#{version}/Chatty_v#{version}.dmg"

    livecheck do
      url "https://github.com/dehesselle/chatty/releases"
      strategy :page_match
      regex(%r{href=.*?/Chatty_v(\d+(?:\.\d+)+_mac\d+)\.dmg}i)
    end
  else
    version "0.14_mac46"
    sha256 "7d021002ae5088ae660b11b9621687921bd7de93a955b71718f26c93924db7e4"
    url "https://github.com/dehesselle/chatty/releases/download/v#{version}/Chatty_v#{version}_arm64.dmg"

    livecheck do
      url "https://github.com/dehesselle/chatty/releases"
      strategy :page_match
      regex(%r{href=.*?/Chatty_v(\d+(?:\.\d+)+_mac\d+)_arm64\.dmg}i)
    end
  end

  name "Chatty"
  desc "Twitch Chat Client for Desktop"
  homepage "https://github.com/dehesselle/chatty"

  app "Chatty.app"
end
