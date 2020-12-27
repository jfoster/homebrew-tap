class License < Formula
  desc "Command-line license text generator"
  homepage "https://github.com/nishanths/license"
  url "https://github.com/nishanths/license/archive/v5.0.0.tar.gz"
  sha256 "4a011e5c044dd7991b0ddec9a5a6efd50cfb38af0ea8dc2324695975a9c9fb7a"
  license "MIT"
  head "https://github.com/nishanths/license.git"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "true"
  end
end
