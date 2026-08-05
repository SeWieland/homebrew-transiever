class Srtx < Formula
  desc "Create Sieve scripts from rule files; inspect, optimize, preview, and deploy"
  homepage "https://github.com/SeWieland/Transiever.SieveRuler"
  url "https://github.com/SeWieland/Transiever.SieveRuler/releases/download/v1.1.0/srtx-v1.1.0-linux-x64.tar.gz"
  sha256 "0b2ed202f56c1c57a4849590a68bb3dbe5b40bd68cbd369995c08ecee2dcb790"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :x86_64
  depends_on "icu4c"
  depends_on :linux

  def install
    libexec.install "srtx"
    (bin/"srtx").write_env_script libexec/"srtx", LD_LIBRARY_PATH: formula_opt_lib("icu4c")
  end

  test do
    assert_match "srtx", shell_output("#{bin}/srtx --help")
  end
end
