cask "rclone" do
  version "1.57.0"
  sha256 "c25cfe8c61da6da361940904511fcafb0f305e6eaa926f9871045de55e6861a4"

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
