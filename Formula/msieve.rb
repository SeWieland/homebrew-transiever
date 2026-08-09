class Msieve < Formula
  desc "ManageSieve client to list, download, upload, and activate Sieve scripts"
  homepage "https://github.com/SeWieland/Transiever.ManageSieve"
  url "https://github.com/SeWieland/Transiever.ManageSieve/releases/download/v1.1.2/msieve-v1.1.2-linux-x64.tar.gz"
  sha256 "8638dc79030fcf6d71f3b1240db927039f7e3a57c6b13b804210b647e9723975"
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
