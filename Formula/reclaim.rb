# Homebrew formula TEMPLATE for reclaim — do not edit the placeholders.
#
# The `homebrew` job in .github/workflows/release.yml fills in 0.3.0 and
# the SHA256 placeholders from the release artifacts, then pushes the result
# to ImadRashid/homebrew-tap as Formula/reclaim.rb (requires the
# TAP_GITHUB_TOKEN repo secret). No manual steps.
class Reclaim < Formula
  desc "Developer-aware Mac cleaner CLI"
  homepage "https://github.com/ImadRashid/reclaim"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_darwin_arm64.tar.gz"
      sha256 "84db58e72c6b4b8bedc928856bcc282929f73f0b77f65c7ee005934a13f54791"
    end
    on_intel do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_darwin_amd64.tar.gz"
      sha256 "0a7833eb86b4292328cdfdffe04ca7b1398ab9e655da988fcaab983df4f7c1b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_linux_arm64.tar.gz"
      sha256 "f861d5de349a3fead46460100819684d4eff99a88b13dfb85eac5db4a624aba5"
    end
    on_intel do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_linux_amd64.tar.gz"
      sha256 "0d42b0fb44574ea3215d8d11abd9907fc1598bdda24d8e6c4b46d3e789303904"
    end
  end

  def install
    bin.install "reclaim"
    doc.install "README.md"
  end

  test do
    assert_match "reclaim #{version}", shell_output("#{bin}/reclaim --version")
  end
end
