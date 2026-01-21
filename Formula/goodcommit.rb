class Goodcommit < Formula
  desc "Good Commit: fast, reliable AI commit messages"
  homepage "https://github.com/Bikz/goodcommit"
  version "0.2.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Bikz/goodcommit/releases/download/v0.2.9/goodcommit-aarch64-apple-darwin.tar.gz"
      sha256 "8d36884241afbaee1e79e506ca0a022ebabda96b67977ad0484b517aea4caec2"
    else
      url "https://github.com/Bikz/goodcommit/releases/download/v0.2.9/goodcommit-x86_64-apple-darwin.tar.gz"
      sha256 "f17235072b63562e19f1ea0f310ca08aa64ccbf8a197cf00ef8ce7ef86d417b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "linux arm64 builds are not yet available"
    end

    url "https://github.com/Bikz/goodcommit/releases/download/v0.2.9/goodcommit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ce9f2b0554417fad61b48aad0972d74556766fd8d2cc77ef08de1d1a8b68881d"
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
