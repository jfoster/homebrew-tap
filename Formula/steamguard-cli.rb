class SteamguardCli < Formula
  desc "Utility for generating Steam 2FA codes and managing trade confirmations"
  homepage "https://github.com/dyc3/steamguard-cli"
  url "https://github.com/dyc3/steamguard-cli/archive/refs/tags/v0.4.5.tar.gz"
  sha256 "d31f5b5915b02191802cf83f2417717b8f5238cb9698027ec7bd5ab1516cb472"
  license "GPL-3.0-only"
  head "https://github.com/dyc3/steamguard-cli.git", branch: "master"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/steamguard-cli-0.4.4_2"
    sha256 cellar: :any_skip_relocation, big_sur:  "c3d1a65d543aa67d25204282d2c347edc217ca232b668dc3d2e50069ebbefaf0"
    sha256 cellar: :any_skip_relocation, catalina: "71cb01b4dfffb908b5f2bf3bcc39b015c3afdc2052d745eee136602ebed03f4d"
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
