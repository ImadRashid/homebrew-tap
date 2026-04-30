class Reclaim < Formula
  desc "Developer-aware Mac cleaner CLI"
  homepage "https://github.com/ImadRashid/reclaim"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_darwin_arm64.tar.gz"
      sha256 "6163a5436d8f3d4a7cfd64ac8777126a4229b7350b6bcf290e38f3706aba20fd"
    end
    on_intel do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_darwin_amd64.tar.gz"
      sha256 "e7f2fd69ee363b533668a5bf3ee89af415808e8a1f369f09fdea2d4601070130"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_linux_arm64.tar.gz"
      sha256 "9a201f29d41d343dcd90b21d35d1d4bedbf0a3979d16938e16918e46f3520db6"
    end
    on_intel do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_linux_amd64.tar.gz"
      sha256 "e7993b8d61689a018473ac8b58bb84ca795c76f43d8416f9051951c35a505b0f"
    end
  end

  def install
    # Release tarball extracts into reclaim_vX.Y.Z_<os>_<arch>/ but stage()
    # cd's us into that staged copy already, so the binary is at the root.
    bin.install "reclaim"
    doc.install "README.md"
  end

  test do
    assert_match "reclaim #{version}", shell_output("#{bin}/reclaim --version")
  end
end
