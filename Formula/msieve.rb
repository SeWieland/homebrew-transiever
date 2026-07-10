class Msieve < Formula
  desc "Command-line client for direct ManageSieve protocol operations"
  homepage "https://github.com/SeWieland/Transiever.ManageSieve"
  url "https://github.com/SeWieland/Transiever.ManageSieve/releases/download/v1.0.0/msieve-v1.0.0-linux-x64.tar.gz"
  version "1.0.0"
  sha256 "8716bf0c678348c3ec4a23e354e4068afbd3d28dc1475c477b2ac660e3d9dbbb"
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
