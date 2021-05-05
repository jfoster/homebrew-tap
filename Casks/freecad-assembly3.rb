cask "freecad-assembly3" do
  version "0.11,20210504"
  sha256 "df17e73b180ba82029e04512ec197bd4ac220ee89199f46b213df36398205f36"

  url "https://github.com/realthunder/FreeCAD_assembly3/releases/download/#{version.before_comma}/FreeCAD-asm3-Stable-OSX-Conda-Py3-Qt5-#{version.after_comma}-x86_64.dmg"
  name "FreeCAD Assembly3"
  desc "3D parametric modeler"
  homepage "https://github.com/realthunder/FreeCAD_assembly3"

  livecheck do
    url "https://github.com/realthunder/FreeCAD_assembly3/releases"
    strategy :page_match do |page|
      match = page.match(
        %r{href=.*?/(\d+(?:\.\d+)*)/FreeCAD-asm3-Stable-.*?-(\d+?)-x86_64\.dmg}i,
      )
      "#{match[1]},#{match[2]}"
    end
  end

  depends_on macos: ">= :sierra"

  app "FreeCAD.app", target: "FreeCADLink.app"
end
