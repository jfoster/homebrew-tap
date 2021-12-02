class F1viewer < Formula
  desc "🏎️ TUI for F1TV"
  homepage "https://github.com/SoMuchForSubtlety/f1viewer"
  url "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "6dde41cafb849e533455e4ebe2418f7ae65db26dca0fd30569a909c6114adc6a"
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
