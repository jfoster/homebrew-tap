class Deemix < Formula
  include Language::Python::Virtualenv

  desc "Deezer downloader"
  homepage "https://www.reddit.com/r/deemix"
  url "https://files.pythonhosted.org/packages/f3/38/c355c5bf51eaf53f7256b5a1dd655364a4b7f44e203e80b710a13ad7de24/deemix-3.5.3.tar.gz"
  sha256 "36dc6279f547cc0947daceb568e2b5ac1e274655f642c133e2700c22892163ce"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/deemix-3.5.3"
    sha256 cellar: :any_skip_relocation, big_sur:  "f4034daa23abd180e205d7802580906a95eae9f8674e7fb8e31f34ce11db4aef"
    sha256 cellar: :any_skip_relocation, catalina: "60bafc7f8d1271af36b46c0718643c9aeef8dfdec40139b31ea64b0004999a61"
  end

  depends_on "python@3.8"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/6d/78/f8db8d57f520a54f0b8a438319c342c61c22759d8f9a1cd2e2180b5e5ea9/certifi-2021.5.30.tar.gz"
    sha256 "2bbf76fd432960138b3ef6dda3dde0544f27cbf8546c458e60baf371917ba9ee"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/eb/7f/a6c278746ddbd7094b019b08d1b2187101b1f596f35f81dc27f57d8fcf7c/charset-normalizer-2.0.6.tar.gz"
    sha256 "5ec46d183433dcbd0ab716f2d7f29d8dee50505b3fdb40c6b985c7c4f5a3591f"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/21/83/308a74ca1104fe1e3197d31693a7a2db67c2d4e668f20f43a2fca491f9f7/click-8.0.1.tar.gz"
    sha256 "8c04c11192119b1ef78ea049e0a6f0463e4c48ef00a30160c704337586f3ad7a"
  end

  resource "deezer-py" do
    url "https://files.pythonhosted.org/packages/7d/5b/f0cec981d7a80b3571c871c920993f71c828b2fb57790082a5d7119404f6/deezer-py-1.2.3.tar.gz"
    sha256 "f4dd648e5bf251cb13316145e243d3a08d870840e0ac1525309926e640c91ea9"
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
    url "https://files.pythonhosted.org/packages/a3/33/1e5040f7c82bce5db00a4101c159339263069717b1155b4b8fa710d19721/pycryptodomex-3.10.4.tar.gz"
    sha256 "acd3498a8ccf8ad20ce7daa5f7f5e6521465eeceb026f28a6adb0228dd9fcc6e"
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
