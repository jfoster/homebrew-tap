class R128gain < Formula
  include Language::Python::Virtualenv

  desc "Fast audio loudness scanner & tagger"
  homepage "https://github.com/desbma/r128gain"
  url "https://files.pythonhosted.org/packages/b8/74/efd73dd810e78b5e358b463e7aea3a541942a484f7e38b907570a2b0b7a9/r128gain-1.0.6.tar.gz"
  sha256 "cc49a9f1f28d69020ffbf97a8d4963b1cc328b955e6503d3d13cd01d0cf89f41"
  license "LGPL-2.1-or-later"
  revision 2

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/r128gain-1.0.6_2"
    sha256 cellar: :any_skip_relocation, monterey: "3e059b0b4fcdada290daf74bf430fb6f90e075d082fd7c91427272cac873ee3c"
    sha256 cellar: :any_skip_relocation, big_sur:  "a43867246822c15506543b551de41bedd8caceca7e6bc25533467d7b7f4c5a40"
    sha256 cellar: :any_skip_relocation, catalina: "f0a4683fd993bcf483ae9b32e518b893f17f8145ae25cfd331447bec4f76b549"
  end

  depends_on "python@3.10"

  resource "crcmod" do
    url "https://files.pythonhosted.org/packages/6b/b0/e595ce2a2527e169c3bcd6c33d2473c1918e0b7f6826a043ca1245dd4e5b/crcmod-1.7.tar.gz"
    sha256 "dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f283601e"
  end

  resource "ffmpeg-python" do
    url "https://files.pythonhosted.org/packages/dd/5e/d5f9105d59c1325759d838af4e973695081fbbc97182baf73afc78dec266/ffmpeg-python-0.2.0.tar.gz"
    sha256 "65225db34627c578ef0e11c8b1eb528bb35e024752f6f10b78c011f6f64c4127"
  end

  resource "future" do
    url "https://files.pythonhosted.org/packages/45/0b/38b06fd9b92dc2b68d58b75f900e97884c45bedd2ff83203d933cf5851c9/future-0.18.2.tar.gz"
    sha256 "b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d"
  end

  resource "mutagen" do
    url "https://files.pythonhosted.org/packages/f3/d9/2232a4cb9a98e2d2501f7e58d193bc49c956ef23756d7423ba1bd87e386d/mutagen-1.45.1.tar.gz"
    sha256 "6397602efb3c2d7baebd2166ed85731ae1c1d475abca22090b7141ff5034b3e1"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/98/2a/838de32e09bd511cf69fe4ae13ffc748ac143449bfc24bb3fd172d53a84f/tqdm-4.64.0.tar.gz"
    sha256 "40be55d30e200777a307a7585aee69e4eabb46b4ec6a4b4a5f2d9f11e7d5408d"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "true"
  end
end
