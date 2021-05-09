cask "nowtvplayer" do
  version :latest
  sha256 :no_check

  url "https://web.static.nowtv.com/watch/player/nowtv/gb/latest/NOWTVPlayer-Mac.dmg"
  name "Now TV Player"
  desc "Watch NOW TV"
  homepage "https://www.nowtv.com/"

  livecheck do
    skip
  end

  app "NOW TV Player.app"
end
