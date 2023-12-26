class Sleeper < Formula
  desc "A macOS utility for managing computer sleep behavior"
  homepage "https://github.com/thekidnamedkd/homebrew-sleeper"
  url "https://github.com/thekidnamedkd/homebrew-sleeper/raw/v1.0.3/sleeper-app.tar.gz"
  sha256 "f14c26dc37c13d4b01b01ae93fadc18759e5774c6fa32e7fb2554a7d421d42ed"

  def install
    bin.install "sleeper_config.sh"
    bin.install "sleeper_loop.sh"
    bin.install "sleeper_execute.scpt"
    libexec.install "sleeper_launch.plist"
  end

  def caveats; <<~EOS
    To configure Sleeper, run the configuration script in the installation directory:
    cd $(brew --prefix)/bin
    ./sleeper_config.sh
    EOS
  end

end