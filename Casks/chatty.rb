cask "chatty" do
  version "0.14_mac45"

  if Hardware::CPU.intel?
    sha256 "6132a96127eed0148ecfc314ba555eb54fef9057b7e780a641a9841170053435"
    url "https://github.com/dehesselle/chatty/releases/download/v#{version}/Chatty_v#{version}_x64.dmg"
  else
    sha256 "56222ee217afc7e1f7e12fc6d20538dc276b5be7b5746be55b7c98377d0ffc28"
    url "https://github.com/dehesselle/chatty/releases/download/v#{version}/Chatty_v#{version}_arm64.dmg"
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
