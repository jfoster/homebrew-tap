class Theos < Formula
  desc "Cross-platform suite of tools for building and deploying software for iOS"
  homepage "https://theos.dev"
  url "https://github.com/theos/theos/archive/2.5.tar.gz"
  sha256 "20539477e6d517917c93914d1c6f2920c172fb006139863675b8ac23505bede5"
  license "GPL-3.0-only"
  head "https://github.com/theos/theos.git"

  bottle :unneeded

  depends_on "ldid"
  depends_on :xcode
  depends_on "xz"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "true"
  end
end
