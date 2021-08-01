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
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/f1viewer-2.2.0_1"
    sha256 cellar: :any_skip_relocation, big_sur:  "bb14df1950a20d8c22937cf00de35a5aba845de15b55d5f7ea560368f51d6535"
    sha256 cellar: :any_skip_relocation, catalina: "ea4d2c48e0b3f2bfe09eca1b1a1c216f11b744a06af6df39d145220bb219ec2f"
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
