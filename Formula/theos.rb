class Theos < Formula
  desc "Cross-platform suite of tools for building and deploying software for iOS"
  homepage "https://theos.dev"
  url "https://github.com/theos/theos.git", tag: "2.5"
  sha256 "20539477e6d517917c93914d1c6f2920c172fb006139863675b8ac23505bede5"
  license "GPL-3.0-only"
  revision 3
  head "https://github.com/theos/theos.git"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/theos-2.5_3"
    sha256 cellar: :any_skip_relocation, big_sur:  "0bad5b78da0a2bd6abd4bf607c7035e9ddfefe872c12579712d3731f14a93b7d"
    sha256 cellar: :any_skip_relocation, catalina: "91cbeb0146f4679f715223e4a7a96f97936b0e34b256a3ed03bc4f6ed7f96832"
  end

  depends_on "ldid"
  depends_on :macos
  depends_on :xcode
  depends_on "xz"

  def install
    prefix.install Dir["*"]
    rm Dir["#{prefix}/*/.keep"]
  end

  test do
    system "true"
  end
end
