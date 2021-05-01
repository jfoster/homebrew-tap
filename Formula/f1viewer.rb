class F1viewer < Formula
  desc "🏎️ TUI for F1TV"
  homepage "https://github.com/SoMuchForSubtlety/f1viewer"
  url "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "2e5e0c1db55912c6ff5f65895c023ffa7923b14e465d032bcacdcd61441be25f"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.0.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "40ac8f0d8429215bfc2a09f39ed4ab4ad479d7d36b0cbb7a6ab045717e48dae4"
    sha256 cellar: :any_skip_relocation, catalina:     "e9a2b2dadb7241f45bef582407eb4200f60ac61cb6d1cc9548f5c2086f571a1b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c2b665f8bebde530804f2ff8bef5ef8b3154166fd522bcb0ea31e7c26e5e7c9c"
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
