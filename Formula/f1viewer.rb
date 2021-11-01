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
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.4.0"
    sha256 cellar: :any_skip_relocation, big_sur:  "a9b0f3996bbb9273bb7a07dafae46f851fbb9c488f4f3c66b9f3cbf4699fa3f3"
    sha256 cellar: :any_skip_relocation, catalina: "8995e2b075575895d92946a72b5751061cffa050aa7fd5c09b74a63198d967f2"
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
