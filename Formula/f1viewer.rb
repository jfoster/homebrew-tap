class F1viewer < Formula
  desc "🏎️ TUI for F1TV"
  homepage "https://github.com/SoMuchForSubtlety/f1viewer"
  url "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/v2.7.0.tar.gz"
  sha256 "a5bbe1f1e830ac7ce281a2559daeb48359cc2568cdafb6e7c3e10262dc2e6088"
  license "GPL-3.0-only"
  revision 1
  head "https://github.com/SoMuchForSubtlety/f1viewer.git"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.7.0_1"
    sha256 cellar: :any_skip_relocation, monterey: "162e3f34c5ef77e2320dfc47ff3af0b7886945d2541a15f589fcc0fc165f47c4"
    sha256 cellar: :any_skip_relocation, big_sur:  "3df71bac4f7ed7da77e1b254b0b389f04349be233c8f6daf5cf79b310c2e3dc0"
    sha256 cellar: :any_skip_relocation, catalina: "9680f6b00282b12e4769996514eec8f6cdf561955ce4e09e50dcf79c6f2a4344"
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
