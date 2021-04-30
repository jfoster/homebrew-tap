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
    help_output = shell_output("#{bin}/license -list")
    assert_match "agpl-3.0      (GNU Affero General Public License v3.0)", help_output

    (testpath/"LICENSE.test").write <<~EOS
      BSD 2-Clause License

      Copyright (c) 2009-present, Homebrew contributors
      All rights reserved.

      Redistribution and use in source and binary forms, with or without
      modification, are permitted provided that the following conditions are met:

      1. Redistributions of source code must retain the above copyright notice, this
         list of conditions and the following disclaimer.

      2. Redistributions in binary form must reproduce the above copyright notice,
         this list of conditions and the following disclaimer in the documentation
         and/or other materials provided with the distribution.

      THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
      AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
      IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
      DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
      FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
      DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
      SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
      CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
      OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
      OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
    EOS

    system bin/"license", "-o", "LICENSE.txt", "-n", "Homebrew contributors", "-y", "2009-present", "bsd-2-clause"
    assert_match File.read("LICENSE.test"), File.read("LICENSE.txt")
  end
end
