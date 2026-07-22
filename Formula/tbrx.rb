class Tbrx < Formula
  desc "Export Thunderbird filters and synchronize them to server-side Sieve"
  homepage "https://github.com/SeWieland/Transiever.ThunderbirdResiever"
  url "https://github.com/SeWieland/Transiever.ThunderbirdResiever/releases/download/v1.0.0-beta.1/tbrx-v1.0.0-beta.1-linux-x64.tar.gz"
  sha256 "58dd997494f25d68165935154bc4c13d16b6f0b6dc55e994751f4ff18665c11c"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+-beta\.\d+)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  depends_on arch: :x86_64
  depends_on "icu4c"
  depends_on :linux

  def install
    libexec.install "tbrx"
    (bin/"tbrx").write_env_script libexec/"tbrx", LD_LIBRARY_PATH: formula_opt_lib("icu4c")
  end

  def caveats
    <<~EOS
      tbrx is an unstable beta and testers are wanted.
      Report redacted results at https://github.com/SeWieland/Transiever.ThunderbirdResiever/issues
    EOS
  end

  test do
    account = testpath/"profile/ImapMail/imap.example.com"
    account.mkpath
    (testpath/"profile/prefs.js").write <<~EOS
      user_pref("mail.account.account1.server", "server1");
      user_pref("mail.server.server1.type", "imap");
      user_pref("mail.server.server1.hostname", "imap.example.com");
      user_pref("mail.server.server1.userName", "user@example.com");
      user_pref("mail.server.server1.directory-rel", "[ProfD]ImapMail/imap.example.com");
    EOS
    (account/"msgFilterRules.dat").write <<~EOS
      version="9"
      logging="no"
      name="Homebrew fixture"
      enabled="yes"
      type="1"
      action="Mark read"
      condition="AND (from,contains,tester@example.com)"
    EOS

    assert_match "tbrx experimental beta", shell_output("#{bin}/tbrx --help")
    shell_output("#{bin}/tbrx export --profile #{testpath}/profile --rules #{testpath}/rules.json")
    assert_match "Homebrew fixture", (testpath/"rules.json").read
  end
end
