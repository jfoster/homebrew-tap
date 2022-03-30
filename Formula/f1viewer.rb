class F1viewer < Formula
  desc "🏎️ TUI for F1TV"
  homepage "https://github.com/SoMuchForSubtlety/f1viewer"
  url "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/v2.6.2.tar.gz"
  sha256 "84db08cf70be01b93038943484eaa5396ac26f93a719cb38109f3033b34a2b05"
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
