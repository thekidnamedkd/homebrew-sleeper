class Sleeper < Formula
  desc "A macOS utility for managing computer sleep behavior"
  homepage "https://github.com/thekidnamedkd/homebrew-sleeper"
  url "https://github.com/thekidnamedkd/homebrew-sleeper/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "751c031648920cf397bffb3dedcd3a6524b9aa421e5d20f11349f6e767afc873"

  def install
    bin.install "./v.1.0.0/sleeper_config.sh"
    bin.install "./v.1.0.0/sleeper_loop.sh"
    bin.install "./v.1.0.0/sleeper_execute.scpt"
    libexec.install "./v.1.0.0/sleeper_launch.plist"
    doc.install "./v.1.0.0/README.md"
  end

  def caveats; <<~EOS
    To configure Sleeper, run the configuration script in the installation directory:
    cd #{var.homebrew_prefix}/bin
    ./sleeper_config.sh
  EOS
  end
end