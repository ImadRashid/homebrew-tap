class Csm < Formula
  desc "Claude Session Manager - pin Claude Code accounts per project"
  homepage "https://github.com/ImadRashid/claude-session-manager"
  url "https://github.com/ImadRashid/claude-session-manager/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0a9c8e1c91cbb83cad7c8d53472be3f50addf48049a2d1a9e94cfc94e9577bf1"
  license "MIT"

  def install
    bin.install "bin/csm"
  end

  def caveats
    <<~EOS
      Enable per-project account switching by adding this to ~/.zshrc or ~/.bashrc:
        eval "$(csm shell)"
    EOS
  end

  test do
    assert_match "csm", shell_output("#{bin}/csm version")
  end
end
