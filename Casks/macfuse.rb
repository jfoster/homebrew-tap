cask "macfuse" do
  version "4.0.5"
  sha256 "6365d10c9e388ac7a91fe1e65d54694faad69149f421125eaddfff07d48763ea"

  url "https://github.com/osxfuse/osxfuse/releases/download/macfuse-#{version}/macfuse-#{version}.dmg",
      verified: "github.com/osxfuse/osxfuse/"
  appcast "https://github.com/osxfuse/osxfuse/releases.atom"
  name "macFUSE"
  desc "File system integration"
  homepage "https://osxfuse.github.io/"

  pkg "Extras/macFUSE #{version}.pkg"

  postflight do
    set_ownership ["/usr/local/include", "/usr/local/lib"]
  end

  uninstall kext:    "com.github.osxfuse.filesystems.osxfuse",
            pkgutil: [
              "com.github.osxfuse.pkg.Core",
              "com.github.osxfuse.pkg.MacFUSE",
              "com.github.osxfuse.pkg.PrefPane",
            ]

  zap trash: "~/Library/Caches/com.github.osxfuse.OSXFUSEPrefPane"

  caveats do
    reboot
  end
end