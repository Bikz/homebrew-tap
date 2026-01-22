class Goodcommit < Formula
  desc "Good Commit: fast, reliable AI commit messages"
  homepage "https://github.com/Bikz/goodcommit"
  version "0.3.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Bikz/goodcommit/releases/download/v0.3.3/goodcommit-aarch64-apple-darwin.tar.gz"
      sha256 "a56beeff00ae99dc7db599ea6c06b118ed8dce056584be40fbc29866220d0dd4"
    else
      url "https://github.com/Bikz/goodcommit/releases/download/v0.3.3/goodcommit-x86_64-apple-darwin.tar.gz"
      sha256 "c0af049d654bd5951a2c432662aa1d826b853a02bcc336dc3f42df6ea6eef1fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "linux arm64 builds are not yet available"
    end

    url "https://github.com/Bikz/goodcommit/releases/download/v0.3.3/goodcommit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f232404c52585b437a1a641866dccdebfb47b64b9aea6042ca645ca53bc717f7"
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
