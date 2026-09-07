class Msieve < Formula
  desc "ManageSieve client to list, download, upload, and activate Sieve scripts"
  homepage "https://github.com/SeWieland/Transiever.ManageSieve"
  url "https://github.com/SeWieland/Transiever.ManageSieve/releases/download/v1.3.0/msieve-v1.3.0-linux-x64.tar.gz"
  sha256 "6996fd6c191c3f7f5fc496202a9ec1508a8eaeacd1e2beb1a1619ccf63cd9be6"
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
