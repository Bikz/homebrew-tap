class Goodcommit < Formula
  desc "Good Commit: fast, reliable AI commit messages"
  homepage "https://github.com/Bikz/goodcommit"
  version "0.2.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Bikz/goodcommit/releases/download/v0.2.7/goodcommit-aarch64-apple-darwin.tar.gz"
      sha256 "31d60aee3b54c068f14f85acab2ac6d82b5afcbdc99e1b36f376212284a9c2ba"
    else
      url "https://github.com/Bikz/goodcommit/releases/download/v0.2.7/goodcommit-x86_64-apple-darwin.tar.gz"
      sha256 "9b9656e9513efd88a44ebb2b7d96c1165d167d8c57ffa9412442fb27c0edb820"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "linux arm64 builds are not yet available"
    end

    url "https://github.com/Bikz/goodcommit/releases/download/v0.2.7/goodcommit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "65c5a6e881be9e1f338ec74f3a12514e6e1381a76e7e4cf845bfc3c899338c74"
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
