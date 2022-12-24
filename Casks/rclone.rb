cask "rclone" do
  version "1.61.0"
  sha256 "4c1725016b58ea1a8ae96c842321a2d9ec1f91563e278961c8b3cbe2dcda4a40"

  url "https://github.com/rclone/rclone/releases/download/v#{version}/rclone-v#{version}-osx-amd64.zip",
      verified: "github.com/rclone/rclone"
  name "rclone"
  desc "Command-line program to manage files on cloud storage"
  homepage "https://rclone.org/"

  livecheck do
    url "https://github.com/rclone/rclone/releases"
    strategy :github_latest
  end

  conflicts_with formula: "rclone"
  depends_on cask: "macfuse"

  binary "rclone-v#{version}-osx-amd64/rclone"
end
