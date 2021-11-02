cask "mattercontrol" do
  version :latest
  sha256 :no_check

  url "https://mattercontrol.appspot.com/downloads/mattercontrol-mac-os-x/release",
      verified: "mattercontrol.appspot.com"
  name "mattercontrol"
  desc "All-in-one software package that lets you manage your 3D prints"
  homepage "https://www.matterhackers.com/store/l/mattercontrol/sk/MKZGTDW6"

  pkg "MatterControlSetup.pkg"

  uninstall pkgutil: "com.matterhackers.mattercontrol"
end
