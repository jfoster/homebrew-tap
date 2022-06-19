class SteamguardCli < Formula
  desc "Utility for generating Steam 2FA codes and managing trade confirmations"
  homepage "https://github.com/dyc3/steamguard-cli"
  url "https://github.com/dyc3/steamguard-cli/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "bc1aeb1498a162f78027ea2ed031443d0ca75f6d8b5154341aca23155bec388a"
  license "GPL-3.0-only"
  head "https://github.com/dyc3/steamguard-cli.git", branch: "master"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/steamguard-cli-0.4.3"
    sha256 cellar: :any_skip_relocation, big_sur:  "e98261042d63c91fdec31256649ee7cd6fb379080c9d76fba423639c5f1ac3b8"
    sha256 cellar: :any_skip_relocation, catalina: "fbd354b67fb57314b3b98c8d25fbb177fd6a8f6f1d403f3e452b254cd01e4115"
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
