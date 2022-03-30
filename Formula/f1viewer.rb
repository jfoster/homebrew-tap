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
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.6.1"
    sha256 cellar: :any_skip_relocation, big_sur:  "fe7b93f247d151d074d703ef68d337f9390b78b1b42b3deb91803d0363e597e5"
    sha256 cellar: :any_skip_relocation, catalina: "01f79b81940cee291cf4844b68dfd0b1bc539f19d49ea9000bdb19405929ea65"
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
