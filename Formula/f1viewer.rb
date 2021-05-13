class F1viewer < Formula
  desc "🏎️ TUI for F1TV"
  homepage "https://github.com/SoMuchForSubtlety/f1viewer"
  url "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "0df83a5f657107559586217ea71c460c97dc730785cc14fd8ebf0e75cd1914a9"
  license "GPL-3.0-only"
  revision 2
  head "https://github.com/SoMuchForSubtlety/f1viewer.git"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.0.1_2"
    sha256 cellar: :any_skip_relocation, big_sur:  "583b87226a965a6eb230ff0b23cddd8af6e01bf0bdd980656f7872587e624a90"
    sha256 cellar: :any_skip_relocation, catalina: "c95c89e201935d0c035666f67abe51dcd3418d93061720c20b56ec27aca5a289"
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
