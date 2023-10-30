class SteamguardCli < Formula
  desc "Utility for generating Steam 2FA codes and managing trade confirmations"
  homepage "https://github.com/dyc3/steamguard-cli"
  url "https://github.com/dyc3/steamguard-cli/archive/refs/tags/v0.12.3.tar.gz"
  sha256 "ab61be79e595611d39558af38f3708c9212de687c68ec314e683faeca8bfb3e3"
  license "GPL-3.0-only"
  head "https://github.com/dyc3/steamguard-cli.git", branch: "master"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/steamguard-cli-0.7.0"
    sha256 cellar: :any_skip_relocation, monterey: "91dcab13597faeb5a980203cf17e9acb98c530e68779428bc383fb37c0365c66"
    sha256 cellar: :any_skip_relocation, big_sur:  "20cf11df9aae1f57266ded0a5b43e7351385adf9a9d28758f12542f0643b0a26"
    sha256 cellar: :any_skip_relocation, catalina: "03cf051cc755d7bf0cb0ba8fdae6d74251651bb1025f84c370750f21548b0124"
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
