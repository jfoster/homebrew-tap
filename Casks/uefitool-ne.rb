cask "uefitool-ne" do
  version "A58"
  sha256 "2393b27d6f0ec6a1cf346ebc45137bf7b21af8927406b2f3822297524ec051f1"

  url "https://github.com/LongSoft/UEFITool/releases/download/#{version}/UEFITool_NE_#{version}_mac.zip"
  appcast "https://github.com/LongSoft/UEFITool/releases.atom"
  name "UEFITool"
  desc "Program for parsing, extracting and modifying UEFI firmware images"
  homepage "https://github.com/LongSoft/UEFITool"

  conflicts_with cask: "uefitool"

  app "UEFITool.app"
end
