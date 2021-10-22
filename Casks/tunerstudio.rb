cask "tunerstudio" do
  version "3.0.01"
  sha256 "60648951a891edb4252fdd225c4f8b52fceed846371e420e44f19115635fbc3f"

  url "http://www.tunerstudio.com/downloads2/TunerStudio_MS_#{version}.dmg"
  name "tunerstudio"
  desc ""
  homepage "http://www.tunerstudio.com/"

  app "TunerStudio_MS.app", target: "TunerStudio.app"
end
