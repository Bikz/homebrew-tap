class Goodcommit < Formula
  desc "Good Commit: fast, reliable AI commit messages"
  homepage "https://github.com/Bikz/goodcommit"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Bikz/goodcommit/releases/download/v0.3.0/goodcommit-aarch64-apple-darwin.tar.gz"
      sha256 "cfdf69ed518e700b61da127da5d76074d43052050912faf2011d0c3a3591e6f5"
    else
      url "https://github.com/Bikz/goodcommit/releases/download/v0.3.0/goodcommit-x86_64-apple-darwin.tar.gz"
      sha256 "301a52940f07c08644a61dcd89dc36f689b53879f43116a73359ee45933740fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "linux arm64 builds are not yet available"
    end

    url "https://github.com/Bikz/goodcommit/releases/download/v0.3.0/goodcommit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "40ad0bc07bdd811c946645eccff67e72563623eb8124d59d14d2b7d2d33fd36a"
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
