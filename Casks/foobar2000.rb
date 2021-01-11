cask "foobar2000" do
  version "2.2.14"
  sha256 "95caf9edca5757273ce6292db3ef51dca9c7ac777fb8800e17b6eb65683a82c7"

  url "https://www.foobar2000.org/files/b71180a5bfd689e72b811920b81fb6a1/foobar2000-v#{version}.dmg"
  name "foobar2000"
  desc "Advanced freeware audio player"
  homepage "https://www.foobar2000.org/mac"

  app "foobar2000.app"
end
