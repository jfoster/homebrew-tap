class Deemix < Formula
  include Language::Python::Virtualenv

  desc "Deezer downloader"
  homepage "https://www.reddit.com/r/deemix"
  url "https://files.pythonhosted.org/packages/56/97/d04c6f7c3dfa6f072a656593a39b25ed03babd42096f05f3630dfbe0961d/deemix-3.5.7.tar.gz"
  sha256 "3ce3a2c95e86eec57b8055a34b7c70b3e3a5e0b9fd41a2d83de12ae19ec6ea69"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/deemix-3.5.5"
    sha256 cellar: :any_skip_relocation, big_sur:  "3fa79a3fba862262a32a2eefcd56c442163568a87b3801222110c0871812780b"
    sha256 cellar: :any_skip_relocation, catalina: "aa56acffcb93f0865bf825687cbb98cb01e1801a0932c54172e6c2c53a1715fb"
  end

  depends_on "python@3.8"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/6c/ae/d26450834f0acc9e3d1f74508da6df1551ceab6c2ce0766a593362d6d57f/certifi-2021.10.8.tar.gz"
    sha256 "78884e7c1d4b00ce3cea67b44566851c4343c120abd683433ce934a68ea58872"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/68/e4/e014e7360fc6d1ccc507fe0b563b4646d00e0d4f9beec4975026dd15850b/charset-normalizer-2.0.9.tar.gz"
    sha256 "b0b883e8e874edfdece9c28f314e3dd5badf067342e42fb162203335ae61aa2c"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/f4/09/ad003f1e3428017d1c3da4ccc9547591703ffea548626f47ec74509c5824/click-8.0.3.tar.gz"
    sha256 "410e932b050f5eed773c4cda94de75971c89cdb3155a72a0831139a79e5ecb5b"
  end

  resource "deezer-py" do
    url "https://files.pythonhosted.org/packages/f0/d0/e1a7ee400e4fd791fce9de3aa7a5e900962dd5daa860f086c5817610bc31/deezer-py-1.2.9.tar.gz"
    sha256 "16eacdc9c53f55d2130891c6335e88046afa0601184fd5197fee35a09e99d9cf"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/62/08/e3fc7c8161090f742f504f40b1bccbfc544d4a4e09eb774bf40aafce5436/idna-3.3.tar.gz"
    sha256 "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d"
  end

  resource "mutagen" do
    url "https://files.pythonhosted.org/packages/f3/d9/2232a4cb9a98e2d2501f7e58d193bc49c956ef23756d7423ba1bd87e386d/mutagen-1.45.1.tar.gz"
    sha256 "6397602efb3c2d7baebd2166ed85731ae1c1d475abca22090b7141ff5034b3e1"
  end

  resource "pycryptodomex" do
    url "https://files.pythonhosted.org/packages/f6/06/e2ad9e93210790be86d36c6e2d5524ba54928c3ed27dd0be9b2ced7c57f1/pycryptodomex-3.12.0.zip"
    sha256 "922e9dac0166e4617e5c7980d2cff6912a6eb5cb5c13e7ece222438650bd7f66"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/e7/01/3569e0b535fb2e4a6c384bdbed00c55b9d78b5084e0fb7f4d0bf523d7670/requests-2.26.0.tar.gz"
    sha256 "b8aa58f8cf793ffd8782d3d8cb19e66ef36f7aba4353eec859e74678b01b07a7"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/80/be/3ee43b6c5757cabea19e75b8f46eaf05a2f5144107d7db48c7cf3a864f73/urllib3-1.26.7.tar.gz"
    sha256 "4987c65554f7a2dbf30c18fd48778ef124af6fab771a377103da0585e2336ece"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    help_output = shell_output("#{bin}/deemix --help")
    assert_match "Usage: deemix [OPTIONS] URL...", help_output
  end
end
