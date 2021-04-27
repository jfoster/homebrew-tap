class FuseRequirement < Requirement
  extend T::Sig

  def initialize(tags = [])
    super(tags)
  end

  download "https://osxfuse.github.io/"

  satisfy(build_env: false) { self.class.binary_fuse_installed? }

  sig { returns(T::Boolean) }
  def self.binary_fuse_installed?
    File.exist?("/usr/local/include/fuse/fuse.h") &&
      !File.symlink?("/usr/local/include/fuse")
  end

  env do
    ENV.append_path "PKG_CONFIG_PATH", HOMEBREW_LIBRARY/"Homebrew/os/mac/pkgconfig/fuse"

    unless HOMEBREW_PREFIX.to_s == "/usr/local"
      ENV.append_path "HOMEBREW_LIBRARY_PATHS", "/usr/local/lib"
      ENV.append_path "HOMEBREW_INCLUDE_PATHS", "/usr/local/include/fuse"
    end
  end

  def message
    <<~EOS
      FUSE for macOS is required for this software. #{super}
      brew install --cask macfuse
    EOS
  end
end

class Rclone < Formula
  desc "Rsync for cloud storage"
  homepage "https://rclone.org/"
  url "https://github.com/rclone/rclone/archive/v1.55.1.tar.gz"
  sha256 "b8cbf769c8ed41c6e1dd74de78bf14ee7935ee436ee5ba018f742a48ee326f62"
  license "MIT"
  head "https://github.com/rclone/rclone.git"

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/rclone-1.55.0_3"
    sha256 cellar: :any_skip_relocation, big_sur:      "25e3273238d3accb8a16e8bdfd8801503733b9c7f0e24f467e72447a920ede29"
    sha256 cellar: :any_skip_relocation, catalina:     "75c4a0ff10b2acdab375d115d65abbc016748d92b4c5b32e1de63c303a36f856"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "17ce2f13d596c8004c4699a311ddb85ba4dca9cdc69fd75eb2b9825badf9f4d4"
  end

  depends_on "go" => :build
  depends_on FuseRequirement unless OS.linux?

  def install
    # ENV.deparallelize
    args = *std_go_args
    on_macos do
      args += ["-tags", "cmount"]
    end
    system "go", "build",
      "-ldflags", "-s -X github.com/rclone/rclone/fs.Version=v#{version}",
      *args
    man1.install "rclone.1"
    system bin/"rclone", "genautocomplete", "bash", "rclone.bash"
    system bin/"rclone", "genautocomplete", "zsh", "_rclone"
    bash_completion.install "rclone.bash" => "rclone"
    zsh_completion.install "_rclone"
  end

  # def caveats
  #   <<~EOS
  #   EOS
  # end

  test do
    (testpath/"file1.txt").write "Test!"
    system "#{bin}/rclone", "copy", testpath/"file1.txt", testpath/"dist"
    assert_match File.read(testpath/"file1.txt"), File.read(testpath/"dist/file1.txt")
  end
end
