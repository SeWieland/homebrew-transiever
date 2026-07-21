class Msieve < Formula
  desc "Command-line client for direct ManageSieve protocol operations"
  homepage "https://github.com/SeWieland/Transiever.ManageSieve"
  url "https://github.com/SeWieland/Transiever.ManageSieve/releases/download/v1.0.1/msieve-v1.0.1-linux-x64.tar.gz"
  version "1.0.1"
  sha256 "47fe27ef079635225f645b20ae0608afba530ccfed7cf3c9b8787fcd8ba82d13"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :x86_64
  depends_on "icu4c"
  depends_on :linux

  def install
    libexec.install "msieve"
    (bin/"msieve").write_env_script libexec/"msieve", LD_LIBRARY_PATH: formula_opt_lib("icu4c")
  end

  test do
    assert_match "msieve", shell_output("#{bin}/msieve --help")
  end
end
