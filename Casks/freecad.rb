cask "freecad" do
  version "2022.04.30-edge"
  sha256 "ece919c8551e8624a7fbda92d940d636d2e3e69924baecf0fb9634ed9b4c3992"

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
