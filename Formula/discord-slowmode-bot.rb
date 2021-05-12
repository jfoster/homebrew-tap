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
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/discord-slowmode-bot-0.2.0_5"
    sha256 cellar: :any_skip_relocation, big_sur:  "2add46a8ec2dfd6ca53c2a9a3b9fe2a3a854d7ffbc061272ecf7f36cd1d24f3d"
    sha256 cellar: :any_skip_relocation, catalina: "873cd39902bd5a94963f7596294c38d5c7c928927bd55cf562139f26bf640b27"
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
