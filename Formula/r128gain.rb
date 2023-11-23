class R128gain < Formula
  include Language::Python::Virtualenv

  desc "Fast audio loudness scanner & tagger"
  homepage "https://github.com/desbma/r128gain"
  url "https://files.pythonhosted.org/packages/f7/fb/afd16c3ce447da630720ca16b4826d419b020d266ac6a758d4e33bfb97b1/r128gain-1.0.7.tar.gz"
  sha256 "ece984b8609258989a9158c7f676e1b69402381f535597bf43397e2bb53651e4"
  license "LGPL-2.1-or-later"

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
    url "https://files.pythonhosted.org/packages/8f/2e/cf6accf7415237d6faeeebdc7832023c90e0282aa16fd3263db0eb4715ec/future-0.18.3.tar.gz"
    sha256 "34a17436ed1e96697a86f9de3d15a3b0be01d8bc8de9c1dffd59fb8234ed5307"
  end

  resource "mutagen" do
    url "https://files.pythonhosted.org/packages/81/e6/64bc71b74eef4b68e61eb921dcf72dabd9e4ec4af1e11891bbd312ccbb77/mutagen-1.47.0.tar.gz"
    sha256 "719fadef0a978c31b4cf3c956261b3c58b6948b32023078a2117b1de09f0fc99"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/62/06/d5604a70d160f6a6ca5fd2ba25597c24abd5c5ca5f437263d177ac242308/tqdm-4.66.1.tar.gz"
    sha256 "d88e651f9db8d8551a62556d3cff9e3034274ca5d66e93197cf2490e2dcb69c7"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "true"
  end
end
