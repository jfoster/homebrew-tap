class F1viewer < Formula
  desc "🏎️ TUI for F1TV"
  homepage "https://github.com/SoMuchForSubtlety/f1viewer"
  url "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/v2.6.1.tar.gz"
  sha256 "7931fc5c1c03436336ba5a06c0fdb5cf2b7a1b499458172d0e0bb3b130703b61"
  license "GPL-3.0-only"
  head "https://github.com/SoMuchForSubtlety/f1viewer.git"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.6.0"
    sha256 cellar: :any_skip_relocation, big_sur:  "6354f386936165f7c5d881e835fefe4dbf465b235bcb5b0ba6155de880d9e82d"
    sha256 cellar: :any_skip_relocation, catalina: "1939ff4e0b6e80ffd4cc2bc2a1e90f4b67d2cffb20e6560367c27330a40015d8"
  end

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args, "-ldflags", ldflags
  end

  test do
    version_output = shell_output("#{bin}/f1viewer -v")
    assert_match "Version:     #{version}", version_output
  end
end
