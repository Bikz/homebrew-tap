class Goodcommit < Formula
  desc "Good Commit: fast, reliable AI commit messages"
  homepage "https://github.com/Bikz/goodcommit"
  version "0.3.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Bikz/goodcommit/releases/download/v0.3.2/goodcommit-aarch64-apple-darwin.tar.gz"
      sha256 "10c6071e08a5a27c54e79ddcad8fe40ab35b3b8af1483168eff1d14655ad4e8d"
    else
      url "https://github.com/Bikz/goodcommit/releases/download/v0.3.2/goodcommit-x86_64-apple-darwin.tar.gz"
      sha256 "c357285d9c71787231d2da4d38d2c8749147b9f056e8531b59decbb0d6bd7a5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "linux arm64 builds are not yet available"
    end

    url "https://github.com/Bikz/goodcommit/releases/download/v0.3.2/goodcommit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6648aee5fce097d818f0c0442eb93d0ebf1cc71f6e0e56bdcd09c6d160830d2b"
  end

  def install
    bin.install "goodcommit"
    bin.install_symlink "goodcommit" => "g"
    bin.install_symlink "goodcommit" => "g."
  end

  def caveats
    <<~EOS
      Next steps:
        goodcommit setup

      Commands:
        g
        g.
    EOS
  end

  test do
    assert_match "goodcommit", shell_output("#{bin}/goodcommit --help")
  end
end
