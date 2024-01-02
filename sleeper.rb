class Sleeper < Formula
  desc "A macOS utility for managing computer sleep behavior"
  homepage "https://github.com/thekidnamedkd/homebrew-sleeper"
  url "https://github.com/thekidnamedkd/homebrew-sleeper/raw/v1.0.6/sleeper-app.tar.gz"
  sha256 "0e96c5b066508e062edc4a31822d2cadf4c52de697b10aba5e1a9e9b977d5906"

  def install
    bin.install "sleeper_config.sh"
    bin.install "sleeper_loop.sh"
    bin.install "sleeper_execute.scpt"
    libexec.install "sleeper_launch.plist"

    chmod 0755, bin/"sleeper_config.sh"
    chmod 0755, bin/"sleeper_loop.sh"
  end

  def caveats; <<~EOS
    To configure Sleeper, run the configuration script in the installation directory:
    cd $(brew --prefix)/bin
    ./sleeper_config.sh
    EOS
  end

end