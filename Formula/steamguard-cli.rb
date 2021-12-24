class SteamguardCli < Formula
  desc "Utility for generating Steam 2FA codes and managing trade confirmations"
  homepage "https://github.com/dyc3/steamguard-cli"
  url "https://github.com/dyc3/steamguard-cli/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "8491cd80b6515c4907a67f8aa4984d01057239bb074554b12386dfac35a92014"
  license "GPL-3.0-only"
  revision 1
  head "https://github.com/dyc3/steamguard-cli.git", branch: "master"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/steamguard-cli-0.4.2"
    sha256 cellar: :any_skip_relocation, big_sur:  "e65eaf24c824936237a0604a1aff88e28169a8c71da8d7c0556e0e62c406c227"
    sha256 cellar: :any_skip_relocation, catalina: "1eeef2935d4fbdb6b2fac765804fb752988ce2f7a4812d9a98e9694d0c84f75f"
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
