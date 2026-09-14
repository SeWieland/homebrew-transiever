class Msieve < Formula
  desc "ManageSieve client to list, download, upload, and activate Sieve scripts"
  homepage "https://github.com/SeWieland/Transiever.ManageSieve"
  url "https://github.com/SeWieland/Transiever.ManageSieve/releases/download/v1.4.0/msieve-v1.4.0-linux-x64.tar.gz"
  sha256 "741e8b1b27e6f71a4d3b6390575c7cebab1fc38c390d7cab14d011b1599bab8d"
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
