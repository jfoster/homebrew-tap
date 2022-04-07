cask "freecad-assembly3" do
  version "0.11,20220406"

  if MacOS.version <= :catalina
    sha256 "102a0039bbd25c8dcaa9cbc3f94712f8c0ab9d58e9ffd7da25ad233e7f2c03f3"
    url "https://github.com/realthunder/FreeCAD_assembly3/releases/download/#{version.before_comma}/FreeCAD-asm3-Daily-OSX-Conda-Py3-Qt5-#{version.after_comma}-x86_64.dmg"
  else
    sha256 "251cedd57852801f6b3adcc0944fc6a1c779174834673ff01f1503f1491e1723"
    url "https://github.com/realthunder/FreeCAD_assembly3/releases/download/#{version.before_comma}/FreeCAD-asm3-Daily-BigSur-OSX-Py3-Qt5-#{version.after_comma}-x86_64.dmg"
  end

  name "FreeCAD Assembly3"
  desc "3D parametric modeler"
  homepage "https://github.com/realthunder/FreeCAD_assembly3"

  livecheck do
    url "https://github.com/realthunder/FreeCAD_assembly3/releases/latest"
    strategy :page_match do |page|
      match = page.match(
        %r{href=.*?/(\d+(?:\.\d+)*)/FreeCAD-asm3-.*?-(\d+?)-x86_64\.dmg}i,
      )
      "#{match[1]},#{match[2]}"
    end
  end

  depends_on macos: ">= :sierra"

  app "FreeCAD.app", target: "FreeCADLink.app"
end
