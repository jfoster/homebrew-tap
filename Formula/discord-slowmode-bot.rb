class DiscordSlowmodeBot < Formula
  desc "Discord bot for finer control over channel slowmode functionality"
  homepage "https://github.com/jfoster/discord-slowmode-bot"
  url "https://github.com/jfoster/discord-slowmode-bot/archive/v0.2.0.tar.gz"
  sha256 "3f940e859df9c4d049ab0797d0486abfcad4739c0419e7c71c915f34a9b2fa93"
  license "MIT"
  revision 1
  head "https://github.com/jfoster/discord-slowmode-bot.git"

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/discord-slowmode-bot-0.2.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "32f53368b4d096ae1b12183590d4a848ba6466337e7e83ed0cd2bbd45dbd0f8d"
    sha256 cellar: :any_skip_relocation, catalina:     "3c22edb19c7ef1f37b6cafc31e7b9364611c4a8e0e0b4e48f10a943c24ae9e19"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "76a87d12ec6793ce83451f6fb466a54629202c3ae95d9b396d004805de0a6db5"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./cmd/discord-slowmode-bot"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test discord-slowmode-bot`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end
