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
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.7.0"
    sha256 cellar: :any_skip_relocation, big_sur:  "26f4183f7b5ed0f8cfb2f51a803833fc5888352c5a15ac552e455c838dbe7224"
    sha256 cellar: :any_skip_relocation, catalina: "a1d55e715b6ca3678e03adc5d436bac327ace46429049284494f657ee2245b25"
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
