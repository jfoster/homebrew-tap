class F1viewer < Formula
  desc "🏎️ TUI for F1TV"
  homepage "https://github.com/SoMuchForSubtlety/f1viewer"
  url "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/v2.7.0.tar.gz"
  sha256 "a5bbe1f1e830ac7ce281a2559daeb48359cc2568cdafb6e7c3e10262dc2e6088"
  license "GPL-3.0-only"
  head "https://github.com/SoMuchForSubtlety/f1viewer.git"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.6.2"
    sha256 cellar: :any_skip_relocation, big_sur:  "878b1a73fd8732400d9a49a14b5e5d5a0ec2d059222a3c476f4bb171237bbd9a"
    sha256 cellar: :any_skip_relocation, catalina: "8d91be26b1bd77595276cec37910136101b5f6b1341191b79b357b47ab4f5d2d"
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
