class License < Formula
  desc "Command-line license text generator"
  homepage "https://github.com/nishanths/license"
  url "https://github.com/nishanths/license/archive/v5.0.0.tar.gz"
  sha256 "4a011e5c044dd7991b0ddec9a5a6efd50cfb38af0ea8dc2324695975a9c9fb7a"
  license "MIT"
  revision 3
  head "https://github.com/nishanths/license.git"

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/license-5.0.0_1"
    sha256 cellar: :any_skip_relocation, big_sur:      "5fb9b89671cc1f7e8f079ff76a46f014449554f8d2d25962460e15d0a2ab33e2"
    sha256 cellar: :any_skip_relocation, catalina:     "8073d2c7dd5d420bff6d858f10d4c841ef0c447c191a1f42189b65331fb18a19"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e0186771d566a6d4b8f02af6a36aa738130390376002930b4709782c412aba08"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "true"
  end
end
