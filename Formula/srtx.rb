class Srtx < Formula
  desc "Create Sieve scripts from rule files; inspect, optimize, preview, and deploy"
  homepage "https://github.com/SeWieland/Transiever.SieveRuler"
  url "https://github.com/SeWieland/Transiever.SieveRuler/releases/download/v1.1.4/srtx-v1.1.4-linux-x64.tar.gz"
  sha256 "b95bb2e8890957d31f82950f77ba319207b8eafb87be031b36df2a87fd15447c"
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
