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
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/steamguard-cli-0.5.0"
    sha256 cellar: :any_skip_relocation, big_sur:  "4cb702b865edfa7b8e9e8dfa5c63fb1226c490f1558444718364d4e60fa0fdbd"
    sha256 cellar: :any_skip_relocation, catalina: "c85d91ff7c4b7731e6cf6c91c5974d9b8bb8a3538237ff60e77c33f264374eeb"
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
