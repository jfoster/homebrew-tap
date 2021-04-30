class Deemix < Formula
  include Language::Python::Virtualenv

  desc "Deezer downloader"
  homepage "https://www.reddit.com/r/deemix"
  url "https://files.pythonhosted.org/packages/18/86/98c1deb990954a40e802d6fd1c4e03909ee82b9be23885b7977d2b4a3936/deemix-2.0.16.tar.gz"
  sha256 "09829c6e56fc9d14e999d3d4a8ec59c45f616596be08c19f985d28404affb660"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/deemix-2.0.16"
    sha256 cellar: :any_skip_relocation, big_sur:      "b01e632e9faacc93093e525ded4a03dfbb7b8009524f97c92fea0558eda487b0"
    sha256 cellar: :any_skip_relocation, catalina:     "f549068bd49502327d38cb0ec5c2b9966a940596f6a2e9c201129b5c62f4c832"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b2cce661b43092c72e066aa5747604136de39253c782a713faf7ec85e23dcf54"
  end

  depends_on "python@3.8"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/06/a9/cd1fd8ee13f73a4d4f491ee219deeeae20afefa914dfb4c130cfc9dc397a/certifi-2020.12.5.tar.gz"
    sha256 "1a4995114262bffbc2413b159f2a1a480c969de6e6eb13ee966d470af86af59c"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/ee/2d/9cdc2b527e127b4c9db64b86647d567985940ac3698eeabc7ffaccb4ea61/chardet-4.0.0.tar.gz"
    sha256 "0d6f53a15db4120f2b08c94f11e7d93d2c911ee118b6b30a04ec3ee8310179fa"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/27/6f/be940c8b1f1d69daceeb0032fee6c34d7bd70e3e649ccac0951500b4720e/click-7.1.2.tar.gz"
    sha256 "d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a"
  end

  resource "deezer-py" do
    url "https://files.pythonhosted.org/packages/db/57/4ae4f62284a284795e79e46bb3a173bff58cfd8ad871f2da30321449bd65/deezer-py-0.0.15.tar.gz"
    sha256 "da0fc66c9fd7333c93d920c66815e47f42d9ade6efa85cd6f321ac101ccae469"
  end

  resource "dnspython" do
    url "https://files.pythonhosted.org/packages/ec/c5/14bcd63cb6d06092a004793399ec395405edf97c2301dfdc146dfbd5beed/dnspython-1.16.0.zip"
    sha256 "36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c558e01"
  end

  resource "eventlet" do
    url "https://files.pythonhosted.org/packages/40/9c/bd7bc0202a84012a4b6b653b54a389ef48bc7f13ce628865357ffdf37160/eventlet-0.30.1.tar.gz"
    sha256 "d00649a7e17de0bcddff1a96311ed3baf1b295b3223d4b71aceafe7b45e6d6f8"
  end

  resource "greenlet" do
    url "https://files.pythonhosted.org/packages/92/be/878cc5314fa5aadce33e68738c1a24debe317605196bdfc2049e66bc9c30/greenlet-1.0.0.tar.gz"
    sha256 "719e169c79255816cdcf6dccd9ed2d089a72a9f6c42273aae12d55e8d35bdcf8"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/ea/b7/e0e3c1c467636186c39925827be42f16fee389dc404ac29e930e9136be70/idna-2.10.tar.gz"
    sha256 "b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6"
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
    url "https://files.pythonhosted.org/packages/6b/47/c14abc08432ab22dc18b9892252efaf005ab44066de871e72a38d6af464b/requests-2.25.1.tar.gz"
    sha256 "27973dd4a904a4f13b263a19c866c13b92a39ed1c964655f025f3f8d3d75b804"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426/six-1.15.0.tar.gz"
    sha256 "30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259"
  end

  resource "spotipy" do
    url "https://files.pythonhosted.org/packages/53/f0/d4605b887e01686d01dc1c1d25e8d13af8a12bf1dc1ed3c87e9bd909b49d/spotipy-2.16.1.tar.gz"
    sha256 "4564a6b05959deb82acc96a3fe6883db1ad9f8c73b7ff3b9f1f44db43feba0b8"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/d7/8d/7ee68c6b48e1ec8d41198f694ecdc15f7596356f2ff8e6b1420300cf5db3/urllib3-1.26.3.tar.gz"
    sha256 "de3eedaad74a2683334e282005cd8d7f22f4d55fa690a2a1020a416cb0a47e73"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    help_output = shell_output("#{bin}/deemix --help")
    assert_match "Usage: deemix [OPTIONS] URL...", help_output
  end
end
