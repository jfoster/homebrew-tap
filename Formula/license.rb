class License < Formula
  desc "Command-line license text generator"
  homepage "https://github.com/nishanths/license"
  url "https://github.com/nishanths/license/archive/v5.0.0.tar.gz"
  sha256 "4a011e5c044dd7991b0ddec9a5a6efd50cfb38af0ea8dc2324695975a9c9fb7a"
  license "MIT"
  revision 3
  head "https://github.com/nishanths/license.git"

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/license-5.0.0_3"
    sha256 cellar: :any_skip_relocation, big_sur:      "aed7162933db48b89f14a9c76c0b7a74b74dd48756bff8a784909c938402ba55"
    sha256 cellar: :any_skip_relocation, catalina:     "3b507b2710dd0a2f2dac993cf4a036c0647fa1406f93bca681a455288c3efcfb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9aa9d1bb1d79e99e089a7eaf8498afb32a1ba0e4647e9ebac8645009ffbc2726"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "true"
  end
end
