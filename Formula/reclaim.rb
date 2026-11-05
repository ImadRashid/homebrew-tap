# Homebrew formula TEMPLATE for reclaim — do not edit the placeholders.
#
# The `homebrew` job in .github/workflows/release.yml fills in 0.3.1 and
# the SHA256 placeholders from the release artifacts, then pushes the result
# to ImadRashid/homebrew-tap as Formula/reclaim.rb (requires the
# TAP_GITHUB_TOKEN repo secret). No manual steps.
class Reclaim < Formula
  desc "Developer-aware Mac cleaner CLI"
  homepage "https://github.com/ImadRashid/reclaim"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_darwin_arm64.tar.gz"
      sha256 "2733727737eeec575fafb5aef735ac5aed032a0680975d645c7161e9fc870c35"
    end
    on_intel do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_darwin_amd64.tar.gz"
      sha256 "c26a847737c6811db69e2acb7e5cc85c03fa3a949e5843d6e24bd74a52850560"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_linux_arm64.tar.gz"
      sha256 "33d7cc46aed63a37bd7da0408a221455bafc201ab382e4f270ee3b695f6d02cc"
    end
    on_intel do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_linux_amd64.tar.gz"
      sha256 "0f3aec99f6ee6792415a6abf917399be7f3280d4078a89852e60838c9aeeb082"
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
