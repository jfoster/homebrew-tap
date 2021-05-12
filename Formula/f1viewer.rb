class F1viewer < Formula
  desc "🏎️ TUI for F1TV"
  homepage "https://github.com/SoMuchForSubtlety/f1viewer"
  url "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/v2.0.4.tar.gz"
  sha256 "1ca21302bac36467d9da175495e85fffa33c0b4b842dfe95d597ae6d01f6403a"
  license "GPL-3.0-only"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.0.4"
    sha256 cellar: :any_skip_relocation, big_sur:      "2e1f2cde33bbd581bd7af76124bedd0260b81d071df8fa97921d2c8b819b89d4"
    sha256 cellar: :any_skip_relocation, catalina:     "213817af270198633f564b9c657bd8b44fc230ce91f4c0fc9210cc74d86e65b3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1f147775f316bce48221245fb4030dafccfc8685c2b94ffe6f329ea7c1b3a02d"
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
