class Msieve < Formula
  desc "ManageSieve client to list, download, upload, and activate Sieve scripts"
  homepage "https://github.com/SeWieland/Transiever.ManageSieve"
  url "https://github.com/SeWieland/Transiever.ManageSieve/releases/download/v1.5.0/msieve-v1.5.0-linux-x64.tar.gz"
  sha256 "70a3e37083bb7c69ea2f60e375200f47e7be5eea3f7ae737e3d08cb53acd4972"
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
