class Sleeper < Formula
  desc "A macOS utility for managing computer sleep behavior"
  homepage "https://github.com/thekidnamedkd/homebrew-sleeper"
  url "https://github.com/thekidnamedkd/homebrew-sleeper/raw/v1.0.3/sleeper-app.tar.gz"
  sha256 "3cac49c5a94e669a44a1a4f5dc50323e44abb57cdb6d03096d117e7c2948f6b6"

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