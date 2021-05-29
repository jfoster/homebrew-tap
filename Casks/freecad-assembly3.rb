cask "freecad-assembly3" do
  version "0.11,20210528"

  if MacOS.version <= :catalina
    sha256 "8553040960c758e7fa0fa5518e43db06a0d310cbbbcf4a19057d87558a2040ec"
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
