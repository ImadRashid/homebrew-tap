# Homebrew formula TEMPLATE for reclaim — do not edit the placeholders.
#
# The `homebrew` job in .github/workflows/release.yml fills in 0.2.0 and
# the SHA256 placeholders from the release artifacts, then pushes the result
# to ImadRashid/homebrew-tap as Formula/reclaim.rb (requires the
# TAP_GITHUB_TOKEN repo secret). No manual steps.
class Reclaim < Formula
  desc "Developer-aware Mac cleaner CLI"
  homepage "https://github.com/ImadRashid/reclaim"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_darwin_arm64.tar.gz"
      sha256 "23fc164acae629d73ecfb9b8c044122bc71c08a433b5a30fb5362541f4ad8b36"
    end
    on_intel do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_darwin_amd64.tar.gz"
      sha256 "d7e59b93f46995fa389a409980d7d733e1ab6a6e33e2029d6e6e1b31b11c2964"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_linux_arm64.tar.gz"
      sha256 "cb07b9b11159f2aed02128958d35d92936ede834d40602e90d14aab93ceb9dda"
    end
    on_intel do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_linux_amd64.tar.gz"
      sha256 "392d9f65bfe5983956f53b7a30be85e1b34038f46136f0a6f900c42c2b3b3468"
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
