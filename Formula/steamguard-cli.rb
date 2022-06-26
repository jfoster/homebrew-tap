class SteamguardCli < Formula
  desc "Utility for generating Steam 2FA codes and managing trade confirmations"
  homepage "https://github.com/dyc3/steamguard-cli"
  url "https://github.com/dyc3/steamguard-cli/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "7ef9831618dd64422ba74f956ee364583d4bb81b2072e675e4694b53d2bdfd36"
  license "GPL-3.0-only"
  head "https://github.com/dyc3/steamguard-cli.git", branch: "master"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/steamguard-cli-0.4.5"
    sha256 cellar: :any_skip_relocation, big_sur:  "f54900524d593368709a8f45ec851321a02d832ead1f82bb7fcdd3fe27e385f5"
    sha256 cellar: :any_skip_relocation, catalina: "670fcf7d541bc673effd2b32a5329efa003edbef141b88975d5de488dea1dc1a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    version_output = shell_output("#{bin}/steamguard-cli --version")
    assert_match "steamguard-cli #{version}", version_output
  end
end
