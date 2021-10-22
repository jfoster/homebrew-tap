cask "mattercontrol" do
  version :latest
  sha256 :no_check

  url "https://mattercontrol.appspot.com/downloads/mattercontrol-mac-os-x/release",
      verified: "mattercontrol.appspot.com"
  name "mattercontrol"
  desc "A free, open-source, all-in-one software package that lets you design, slice, organize, and manage your 3D prints"
  homepage "https://www.matterhackers.com/store/l/mattercontrol/sk/MKZGTDW6"

  pkg "MatterControlSetup.pkg"

  uninstall pkgutil: "com.matterhackers.mattercontrol"
end
