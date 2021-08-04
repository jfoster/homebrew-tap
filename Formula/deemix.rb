class Deemix < Formula
  include Language::Python::Virtualenv

  desc "Deezer downloader"
  homepage "https://www.reddit.com/r/deemix"
  url "https://files.pythonhosted.org/packages/bd/84/416d28b4382868e8363e301b380878a206495e345102ac300216a5bffa21/deemix-3.4.1.tar.gz"
  sha256 "146ccc1493a82903cdab8b462352ac30efa2f62059868cf967aec114b12ebf8f"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/deemix-3.4.1"
    sha256 cellar: :any_skip_relocation, big_sur:  "dd1bd7b680a7311f853f4910cd33efb8f2aa828a252ccb4dfee1cca36fbc4815"
    sha256 cellar: :any_skip_relocation, catalina: "e3d94957891592e5e1c20425715237e4dc1eb0b5be4fa53c2d303b14a5cac6e0"
  end

  depends_on "python@3.8"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/6d/78/f8db8d57f520a54f0b8a438319c342c61c22759d8f9a1cd2e2180b5e5ea9/certifi-2021.5.30.tar.gz"
    sha256 "2bbf76fd432960138b3ef6dda3dde0544f27cbf8546c458e60baf371917ba9ee"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/e7/4e/2af0238001648ded297fb54ceb425ca26faa15b341b4fac5371d3938666e/charset-normalizer-2.0.4.tar.gz"
    sha256 "f23667ebe1084be45f6ae0538e4a5a865206544097e4e8bbcacf42cd02a348f3"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/21/83/308a74ca1104fe1e3197d31693a7a2db67c2d4e668f20f43a2fca491f9f7/click-8.0.1.tar.gz"
    sha256 "8c04c11192119b1ef78ea049e0a6f0463e4c48ef00a30160c704337586f3ad7a"
  end

  resource "deezer-py" do
    url "https://files.pythonhosted.org/packages/28/7a/82ec085d8e537b06813d9ca65961010fdd7f90bf346929376b21d0a675e7/deezer-py-1.1.1.tar.gz"
    sha256 "1008863122eb46c174dc530b922cf2dc59be9c095d493c5ef4a7571457a9d224"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/cb/38/4c4d00ddfa48abe616d7e572e02a04273603db446975ab46bbcd36552005/idna-3.2.tar.gz"
    sha256 "467fbad99067910785144ce333826c71fb0e63a425657295239737f7ecd125f3"
  end

  resource "mutagen" do
    url "https://files.pythonhosted.org/packages/f3/d9/2232a4cb9a98e2d2501f7e58d193bc49c956ef23756d7423ba1bd87e386d/mutagen-1.45.1.tar.gz"
    sha256 "6397602efb3c2d7baebd2166ed85731ae1c1d475abca22090b7141ff5034b3e1"
  end

  resource "pycryptodomex" do
    url "https://files.pythonhosted.org/packages/82/e2/a0f9f5452a59bafaa3420585f22b58a8566c4717a88c139af2276bb5695d/pycryptodomex-3.10.1.tar.gz"
    sha256 "541cd3e3e252fb19a7b48f420b798b53483302b7fe4d9954c947605d0a263d62"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/e7/01/3569e0b535fb2e4a6c384bdbed00c55b9d78b5084e0fb7f4d0bf523d7670/requests-2.26.0.tar.gz"
    sha256 "b8aa58f8cf793ffd8782d3d8cb19e66ef36f7aba4353eec859e74678b01b07a7"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e/six-1.16.0.tar.gz"
    sha256 "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
  end

  resource "spotipy" do
    url "https://files.pythonhosted.org/packages/50/0d/dcb5fd830c2a2689ea17a0ae98d29c6ac9be0937fca2779645531a66b796/spotipy-2.18.0.tar.gz"
    sha256 "f7293b808696807e9acec6bdcff63f7dcc3cc1b148c0c4b4299ef43c966f7177"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/4f/5a/597ef5911cb8919efe4d86206aa8b2658616d676a7088f0825ca08bd7cb8/urllib3-1.26.6.tar.gz"
    sha256 "f57b4c16c62fa2760b7e3d97c35b255512fb6b59a259730f36ba32ce9f8e342f"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    help_output = shell_output("#{bin}/deemix --help")
    assert_match "Usage: deemix [OPTIONS] URL...", help_output
  end
end
