class F1viewer < Formula
  desc "🏎️ TUI for F1TV"
  homepage "https://github.com/SoMuchForSubtlety/f1viewer"
  url "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "6dde41cafb849e533455e4ebe2418f7ae65db26dca0fd30569a909c6114adc6a"
  license "GPL-3.0-only"
  revision 1
  head "https://github.com/SoMuchForSubtlety/f1viewer.git"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.5.0"
    sha256 cellar: :any_skip_relocation, big_sur:  "4ec0512c82836a79cd865198d66a352d5e4f8a5691b7ebe3eef878013323958c"
    sha256 cellar: :any_skip_relocation, catalina: "23a0e008d7176ca9ed78195ba6038663a0d769731e669897dd4fa4200ba00ad9"
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
