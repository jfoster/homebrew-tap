class DiscordSlowmodeBot < Formula
  desc "Discord bot for finer control over channel slowmode functionality"
  homepage "https://github.com/jfoster/discord-slowmode-bot"
  url "https://github.com/jfoster/discord-slowmode-bot/archive/v0.2.0.tar.gz"
  sha256 "3f940e859df9c4d049ab0797d0486abfcad4739c0419e7c71c915f34a9b2fa93"
  license "MIT"
  revision 10
  head "https://github.com/jfoster/discord-slowmode-bot.git"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/discord-slowmode-bot-0.2.0_6"
    sha256 cellar: :any_skip_relocation, big_sur:      "4fc36e700754d40fd096a59dffc97bc1d69b524a6c85c097403a9933b2695888"
    sha256 cellar: :any_skip_relocation, catalina:     "c2667c666f879329b6827364d8053a6a657746374325085cdbdce10d0fafdf64"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2d17c727d73c9bcc00b46140516e1b723344fc2f2ff1f36b0a58ad95b6b6c43d"
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
