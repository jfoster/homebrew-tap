class R128gain < Formula
  include Language::Python::Virtualenv

  desc "Fast audio loudness scanner & tagger"
  homepage "https://github.com/desbma/r128gain"
  url "https://github.com/desbma/r128gain/archive/refs/tags/1.0.6.tar.gz"
  sha256 "1aa20b360b845dec303964d3ba1ab2f5361ece465586ca74862ecee1c69223cc"
  license "LGPL-2.1-or-later"

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/r128gain-1.0.6"
    sha256 cellar: :any_skip_relocation, big_sur:  "7b188044dfced9046a18f533968215e9eb4e8360f9a0d5850d1cd35fb28f7aaa"
    sha256 cellar: :any_skip_relocation, catalina: "6c199898f2f14a2eefafb6d04cf835d0b8b7dd48a663c267df63742d4869c485"
  end

  depends_on "python"

  def install
    # ENV.deparallelize
    virtualenv_install_with_resources
  end

  test do
    system "true"
  end
end
