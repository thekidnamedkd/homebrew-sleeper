class Sleeper < Formula
  desc "A macOS utility for managing computer sleep behavior"
  homepage "https://github.com/thekidnamedkd/homebrew-sleeper"
  url "https://github.com/thekidnamedkd/homebrew-sleeper/raw/v1.0.7/sleeper-app.tar.gz"
  sha256 "0bf16c47c172103a66762f56af9b805330ccf78bc36c5d3a343a1a90e3cb46e7"

  def install
    bin.install "sleeper_config.sh"
    bin.install "sleeper_loop.sh"
    bin.install "sleeper_execute.scpt"
    libexec.install "sleeper_launch.plist"
  end

  def post_install
    chmod 0755, bin/"sleeper_config.sh"
    chmod 0755, bin/"sleeper_loop.sh"

    sleeper_loop_path = "#{bin}/sleeper_loop.sh"

    inreplace "#{libexec}/sleeper_launch.plist", "/path/to/sleeper_loop.sh", sleeper_loop_path
  end

  def caveats; <<~EOS
    To configure Sleeper, run the configuration script in the installation directory:
    cd $(brew --prefix)/bin
    ./sleeper_config.sh
  EOS
  end
end
