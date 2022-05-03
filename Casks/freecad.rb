cask "freecad" do
  version "2022.04.30-edge"
  sha256 "aea08698093ffc14c49a5c8a0a531814e6fc72e5a09bbb3e3ff2a9c42457373d"

  url "https://github.com/realthunder/FreeCAD/releases/download/#{version}/FreeCAD-asm3-Stable-OSX-Conda-Py3-Qt5-#{version.delete(".").delete("-edge")}-x86_64.dmg"
  name "FreeCAD"
  desc "3D parametric modeler"
  homepage "https://github.com/realthunder/FreeCAD"

  livecheck do
    url "https://github.com/realthunder/FreeCAD/releases"
    strategy :github_latest
  end

  depends_on macos: ">= :sierra"

  app "FreeCAD.app"
end
