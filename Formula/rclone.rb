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
  url "https://github.com/rclone/rclone/archive/v1.53.3.tar.gz"
  sha256 "46fb317057ada21add1fa683a004e1ad5b2a1523c381f59b40ed1b18f2856ad0"
  license "MIT"
  head "https://github.com/rclone/rclone.git"

  bottle do
    root_url "https://github.com/jfoster/homebrew-tap/releases/download/rclone-1.53.3"
    cellar :any_skip_relocation
    sha256 "322abb82f6d15746d544c6054e6eb8de01651ea81de4f2e777346b489b0c8342" => :x86_64_linux
  end

  depends_on "go" => :build
  depends_on FuseRequirement unless OS.linux?

  def install
    # ENV.deparallelize
    args = *std_go_args
    on_macos do
      args += ["-tags", "brew,cmount"]
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