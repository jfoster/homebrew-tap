class F1viewer < Formula
  desc "🏎️ TUI for F1TV"
  homepage "https://github.com/SoMuchForSubtlety/f1viewer"
  url "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/v2.4.0.tar.gz"
  sha256 "51ff7cc2e32e6b5d0879d308d28cce0f001ab981b83d6e36b695ff7a9ac35e49"
  license "GPL-3.0-only"
  head "https://github.com/SoMuchForSubtlety/f1viewer.git"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.3.0"
    sha256 cellar: :any_skip_relocation, big_sur:  "a9ca9ad380ce844761b36ca8ed4a5795420fbb78f7a33ee47c0b21802310df56"
    sha256 cellar: :any_skip_relocation, catalina: "37b2d181a1d1c115e431bfa46f47189fef3dfa27e825d421067e2e1fd42973f1"
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
