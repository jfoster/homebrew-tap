class DiscordSlowmodeBot < Formula
  desc "Discord bot for finer control over channel slowmode functionality"
  homepage "https://github.com/jfoster/discord-slowmode-bot"
  url "https://github.com/jfoster/discord-slowmode-bot/archive/v0.2.0.tar.gz"
  sha256 "3f940e859df9c4d049ab0797d0486abfcad4739c0419e7c71c915f34a9b2fa93"
  license "MIT"
  revision 5
  head "https://github.com/jfoster/discord-slowmode-bot.git"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/discord-slowmode-bot-0.2.0_4"
    sha256 cellar: :any_skip_relocation, big_sur:      "a58b5cf34881a4b8b0fb0f8d69ee0ea26db4e1dd6afa4b1b652fe48fc0f20514"
    sha256 cellar: :any_skip_relocation, catalina:     "4fca3ab98ceacd07d6f76de695b7d49308c48279bc6acf730138da9d745354f8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "287039853c4b55033ff49f082e7a252b1d050c6886b9f5f03fd7121d4e252740"
  end

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args, "-ldflags", ldflags, "./cmd/discord-slowmode-bot"
  end

  test do
    version_output = shell_output("#{bin}/discord-slowmode-bot --version")
    assert_match "discord-slowmode-bot version #{version}", version_output
  end
end
