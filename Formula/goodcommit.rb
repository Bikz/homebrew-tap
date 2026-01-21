class Goodcommit < Formula
  desc "Good Commit: fast, reliable AI commit messages"
  homepage "https://github.com/Bikz/goodcommit"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Bikz/goodcommit/releases/download/v0.3.1/goodcommit-aarch64-apple-darwin.tar.gz"
      sha256 "280b3e968f8cfd1a4a2c91afc8425eda021fb7b99879b778544d67eaf53b3b1b"
    else
      url "https://github.com/Bikz/goodcommit/releases/download/v0.3.1/goodcommit-x86_64-apple-darwin.tar.gz"
      sha256 "3284862ebdc6159daf97734aab6bc0c354da370eae51c66ac798d59c11ce9204"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "linux arm64 builds are not yet available"
    end

    url "https://github.com/Bikz/goodcommit/releases/download/v0.3.1/goodcommit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d18e1b8b882b6be36dea0eff8a2a7d3548bc70e3bef649de8f1ca57548c56a2c"
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
