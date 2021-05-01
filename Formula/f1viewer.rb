class F1viewer < Formula
  desc "🏎️ TUI for F1TV"
  homepage "https://github.com/SoMuchForSubtlety/f1viewer"
  url "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "0df83a5f657107559586217ea71c460c97dc730785cc14fd8ebf0e75cd1914a9"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.0.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "f7b04d011de1dc7403196d41dc15e27b446a966001a8f79659ded58bace589dc"
    sha256 cellar: :any_skip_relocation, catalina:     "efab51471922331e78d2100eefb134cacadb07c8ad7e51d012e06345b6caf7f3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8553b52dd691014e4677a13af3f1de4ca767decdde024e1df31504cf68c8b243"
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
