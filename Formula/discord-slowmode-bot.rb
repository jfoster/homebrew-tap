class DiscordSlowmodeBot < Formula
  desc "Discord bot for finer control over channel slowmode functionality"
  homepage "https://github.com/jfoster/discord-slowmode-bot"
  url "https://github.com/jfoster/discord-slowmode-bot/archive/v0.2.0.tar.gz"
  sha256 "3f940e859df9c4d049ab0797d0486abfcad4739c0419e7c71c915f34a9b2fa93"
  license "MIT"
  revision 2
  head "https://github.com/jfoster/discord-slowmode-bot.git"

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/discord-slowmode-bot-0.2.0_2"
    sha256 cellar: :any_skip_relocation, big_sur:      "5461531fef1dd73c91dc02f17d87f0beb6e766da1bda3e2d43f4307160755a0a"
    sha256 cellar: :any_skip_relocation, catalina:     "ad089c3b0b735ca3873de28ce8195ce1354a84fc30b898a2205acab3111743d1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9acb2bf8547b705a7b40675c0209e3dfcb8c85f00b8fbd3541cf746fe8ed3f65"
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
