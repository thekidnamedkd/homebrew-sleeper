class Sleeper < Formula
  desc "A macOS utility for managing computer sleep behavior"
  homepage "https://github.com/thekidnamedkd/homebrew-sleeper"
  url "https://github.com/thekidnamedkd/homebrew-sleeper/raw/v1.0.5/sleeper-app.tar.gz"
  sha256 "a5220efad960ca175c84f0fba45ead8d01bbdaf4a30ab87a71fb34d258c71fd1"

  def install
    bin.install "sleeper_config.sh"
    bin.install "sleeper_loop.sh"
    bin.install "sleeper_execute.scpt"
    inreplace "sleeper_launch.plist", "/path/to/sleeper_loop.sh", "#{bin}/sleeper_loop.sh"
    
    libexec.install "sleeper_launch.plist"
  end

  def caveats; <<~EOS
    To configure Sleeper, run the configuration script in the installation directory:
    cd $(brew --prefix)/bin
    ./sleeper_config.sh
    EOS
  end

end