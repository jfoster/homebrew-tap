class SteamguardCli < Formula
  desc "Utility for generating Steam 2FA codes and managing trade confirmations"
  homepage "https://github.com/dyc3/steamguard-cli"
  url "https://github.com/dyc3/steamguard-cli/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "fae8e6b842443c544ee32a4f46bdf49280aa81cb8c443aa45e4c012b9bcef848"
  license "GPL-3.0-only"
  head "https://github.com/dyc3/steamguard-cli.git", branch: "master"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/steamguard-cli-0.5.0_1"
    sha256 cellar: :any_skip_relocation, monterey: "3891a1852202f002cedcc2f465423790db236f3a35ff53db665dd770bfe47f33"
    sha256 cellar: :any_skip_relocation, big_sur:  "b88fc6326f473c78dc19d17ea68f788eb532e9374d5f8c5151f7b6045f52a09c"
    sha256 cellar: :any_skip_relocation, catalina: "75bd6ddc853b5d707a8c3efac0f8a188197d060ac8389903b5f4d411c970c90b"
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
