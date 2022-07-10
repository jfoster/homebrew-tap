cask "rclone" do
  version "1.59.0"
  sha256 "e308c72138c1dc9e72e28a47cbf7bfaaed2cf37c3e9e97cc5a597b2cc06ac85d"

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
