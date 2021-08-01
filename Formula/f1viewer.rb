class F1viewer < Formula
  desc "🏎️ TUI for F1TV"
  homepage "https://github.com/SoMuchForSubtlety/f1viewer"
  url "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "d6a512af83572939e62125b90a9d72ae12a1672c4e6c5760cb924f921abef053"
  license "GPL-3.0-only"
  revision 1
  head "https://github.com/SoMuchForSubtlety/f1viewer.git"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.1.0"
    sha256 cellar: :any_skip_relocation, big_sur:  "e2485b187b8484e28d3f7b897e23be401e938f1451b0c4606ef1ec640cbb3044"
    sha256 cellar: :any_skip_relocation, catalina: "3170616580eb23c0bcf6ffef09a3094263967b63803dadfb0c38e190e5334e18"
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
