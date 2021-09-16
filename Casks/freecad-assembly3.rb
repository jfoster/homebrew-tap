cask "freecad-assembly3" do
  version "0.11,20210916"

  if MacOS.version <= :catalina
    sha256 "ef5c999d8dd0310abac43c0f59b3e1ccb8f38a2ab69c679e95c135ed5df90758"
    url "https://github.com/realthunder/FreeCAD_assembly3/releases/download/#{version.before_comma}/FreeCAD-asm3-Stable-OSX-Conda-Py3-Qt5-#{version.after_comma}-x86_64.dmg"
  else
    sha256 "a10c9a6fcc114a1e6ac8ab0d64624bc438555e1cf540fa14c831e454b2442b6d"
    url "https://github.com/realthunder/FreeCAD_assembly3/releases/download/#{version.before_comma}/FreeCAD-asm3-Stable-BigSur-OSX-Py3-Qt5-#{version.after_comma}-x86_64.dmg"
  end

  name "FreeCAD Assembly3"
  desc "3D parametric modeler"
  homepage "https://github.com/realthunder/FreeCAD_assembly3"

  livecheck do
    url "https://github.com/realthunder/FreeCAD_assembly3/releases/latest"
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
