cask "rclone" do
  version "1.60.1"
  sha256 "d4aad882569aff9ce3278da721369d41d831bb57284c4e40efe0730243b4b84a"

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
