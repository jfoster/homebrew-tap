class F1viewer < Formula
  desc "🏎️ TUI for F1TV"
  homepage "https://github.com/SoMuchForSubtlety/f1viewer"
  url "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "2e5e0c1db55912c6ff5f65895c023ffa7923b14e465d032bcacdcd61441be25f"
  license "GPL-3.0-only"

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
