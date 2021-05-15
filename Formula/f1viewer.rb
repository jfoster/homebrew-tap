class F1viewer < Formula
  desc "🏎️ TUI for F1TV"
  homepage "https://github.com/SoMuchForSubtlety/f1viewer"
  url "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "0df83a5f657107559586217ea71c460c97dc730785cc14fd8ebf0e75cd1914a9"
  license "GPL-3.0-only"
  revision 4
  head "https://github.com/SoMuchForSubtlety/f1viewer.git"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.0.1_3"
    sha256 cellar: :any_skip_relocation, big_sur:      "06833c9c45ee2a6093499cd56c31f69b51599ffba8d8ec1b1de9c5030fbf68c2"
    sha256 cellar: :any_skip_relocation, catalina:     "3e8cadb4941eb1c5242c32b130a0c94bf9537311227bdc10d8d6964ebcbf02f4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4c675e45f25e0df700a20a1ed0e9675d419cc290cbe355bdce21feefc16202b6"
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
