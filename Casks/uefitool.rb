cask "uefitool" do
  version "0.28.0"
  sha256 "3af06adac472b8471b90ba66b3588ce79ee9c2a496b4cb4ce2bd6efc1d175f60"

  url "https://github.com/LongSoft/UEFITool/releases/download/#{version}/UEFITool_#{version}_mac.zip"
  appcast "https://github.com/LongSoft/UEFITool/releases.atom"
  name "UEFITool"
  desc "Program for parsing, extracting and modifying UEFI firmware images"
  homepage "https://github.com/LongSoft/UEFITool"

  app "UEFITool.app"
end
