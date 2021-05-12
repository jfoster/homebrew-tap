class F1viewer < Formula
  desc "🏎️ TUI for F1TV"
  homepage "https://github.com/SoMuchForSubtlety/f1viewer"
  url "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/v2.0.4.tar.gz"
  sha256 "1ca21302bac36467d9da175495e85fffa33c0b4b842dfe95d597ae6d01f6403a"
  license "GPL-3.0-only"
  revision 1

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.0.4_1"
    sha256 cellar: :any_skip_relocation, big_sur:  "229072bbfe4ab7e751f6d5829dd2132c903f49020e0fb3c9f18dd796093ce421"
    sha256 cellar: :any_skip_relocation, catalina: "e5d19492eca78eee7d3c65805af877912237867c5965e57061f7062218ac3c58"
  end

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args, "-ldflags", ldflags, "./cmd/main.go"
  end

  test do
    version_output = shell_output("#{bin}/f1viewer -v")
    assert_match "Version:     #{version}", version_output
  end
end
