class Deemix < Formula
  include Language::Python::Virtualenv

  desc "Deezer downloader"
  homepage "https://www.reddit.com/r/deemix"
  url "https://files.pythonhosted.org/packages/db/cb/3f320c11bbb8fb665b4e2337141b00ce5f10ad4ad1c2b92d3349c8e68445/deemix-2.0.10.tar.gz"
  sha256 "9d8003ed2204ae798811c7331140b7effc967d735a0f9f980103cf779577d56b"
  license "GPL-3.0-only"
  revision 1

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/deemix-2.0.10"
    cellar :any_skip_relocation
    sha256 "7d24122dbcf33488a8a62dbb4563d0d2bfedb0ae64595ed9a41fcec9d90e4843" => :big_sur
    sha256 "a73368723cb3b288550cbb42849a840a91e94c2344d33111a62eb45daf78e1b7" => :catalina
    sha256 "5a273f57ed881c344f15542dd8186fa4e82910894b82f6671bc59e9490c1a619" => :x86_64_linux
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
    url "https://files.pythonhosted.org/packages/b9/e3/073b749ae3b3aa7d132eb24e74bc96094ad3c9d524b714d9f6efbcd6a9f4/deezer-py-0.0.13.tar.gz"
    sha256 "db47074fbc17e7ae7ebd2f5fb3b55061ac4e34e6b4ec38a1bee847dddac9af80"
  end

  resource "dnspython" do
    url "https://files.pythonhosted.org/packages/ec/c5/14bcd63cb6d06092a004793399ec395405edf97c2301dfdc146dfbd5beed/dnspython-1.16.0.zip"
    sha256 "36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c558e01"
  end

  resource "eventlet" do
    url "https://files.pythonhosted.org/packages/0c/dd/cda72b013472d570f9d5670b9260a6d6491829bd4b7697829e8591a24168/eventlet-0.30.0.tar.gz"
    sha256 "19d6f3aa9525221ba60d0ec31b570508021af7ad5497fb77f77501fe9a7c34d3"
  end

  resource "greenlet" do
    url "https://files.pythonhosted.org/packages/72/0c/fd07c7674ad6eded937194b84d8453425c36c6ef118536907b0185624d82/greenlet-0.4.17.tar.gz"
    sha256 "41d8835c69a78de718e466dd0e6bfd4b46125f21a67c3ff6d76d8d8059868d6b"
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
    url "https://files.pythonhosted.org/packages/14/90/f4a934bffae029e16fb33f3bd87014a0a18b4bec591249c4fc01a18d3ab6/pycryptodomex-3.9.9.tar.gz"
    sha256 "7b5b7c5896f8172ea0beb283f7f9428e0ab88ec248ce0a5b8c98d73e26267d51"
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
    url "https://files.pythonhosted.org/packages/29/e6/d1a1d78c439cad688757b70f26c50a53332167c364edb0134cadd280e234/urllib3-1.26.2.tar.gz"
    sha256 "19188f96923873c92ccb987120ec4acaa12f0461fa9ce5d3d0772bc965a39e08"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "true"
  end
end
