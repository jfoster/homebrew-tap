cask "rclone" do
  version "1.55.1"
  sha256 "a226d27b749d8376ceb696401bd3186e9942d5ed055aba2a37cff5d835aa510a"

  url "https://downloads.rclone.org/v#{version}/rclone-v#{version}-osx-amd64.zip"
  name "rclone"
  desc "Command line program to manage files on cloud storage."
  homepage "https://rclone.org"

  livecheck do
    url "https://github.com/rclone/rclone/releases"
    strategy :github_latest
  end

  conflicts_with formula: "rclone"

  binary "rclone-v#{version}-osx-amd64/rclone"
end
