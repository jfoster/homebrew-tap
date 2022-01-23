cask "chatty" do
  version "0.16_mac49"

  if Hardware::CPU.intel?
    sha256 "5f1e60203d09447ca76208a9cdaa7b3e42896739dec6e3263d6c30a97431049e"
    url "https://github.com/dehesselle/chatty/releases/download/v#{version}/Chatty_v#{version}_x64.dmg"
  else
    sha256 "6d9e0b1743fc23a767c599be8430c1cd0f66dfff0e00e6d5aae50b7715429115"
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
