class R128gain < Formula
  include Language::Python::Virtualenv

  desc "Fast audio loudness scanner & tagger"
  homepage "https://github.com/desbma/r128gain"
  url "https://github.com/desbma/r128gain/archive/refs/tags/1.0.6.tar.gz"
  sha256 "1aa20b360b845dec303964d3ba1ab2f5361ece465586ca74862ecee1c69223cc"
  license "LGPL-2.1-or-later"

  depends_on "python"

  def install
    # ENV.deparallelize
    virtualenv_install_with_resources
  end

  test do
    system "true"
  end
end
