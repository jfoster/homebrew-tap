cask "rclone" do
  version "1.56.1"
  sha256 "ae3f83840abeaed5df17c82b7d8f318e88e40642d31297c2d0c4ab80ada62335"

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
