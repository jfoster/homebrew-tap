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
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/theos-2.5_2"
    sha256 cellar: :any_skip_relocation, big_sur:  "fe197625ae318dc02490510e0490b13f6afa408472ce30f5d80cb4a2960d59f6"
    sha256 cellar: :any_skip_relocation, catalina: "fc428b0a116cbd420ed0da8d08d790c9789c5e1f52c00862836e515ab2f55141"
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
