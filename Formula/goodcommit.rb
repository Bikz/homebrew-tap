class Goodcommit < Formula
  desc "Good Commit: fast, reliable AI commit messages"
  homepage "https://github.com/Bikz/goodcommit"
  version "0.2.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Bikz/goodcommit/releases/download/v0.2.10/goodcommit-aarch64-apple-darwin.tar.gz"
      sha256 "dc2249c5708e4145b21b6bebc161ae9e7b2fdd7949b10e2701ce7f005930ca27"
    else
      url "https://github.com/Bikz/goodcommit/releases/download/v0.2.10/goodcommit-x86_64-apple-darwin.tar.gz"
      sha256 "274867fe4234f661f0213773b10935d5861afa84d549b7e9bdd439d7193f13cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "linux arm64 builds are not yet available"
    end

    url "https://github.com/Bikz/goodcommit/releases/download/v0.2.10/goodcommit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b4e612178caf2f88cb426d104870f473729435cc8275c213b4d818b8bdc6c12b"
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
