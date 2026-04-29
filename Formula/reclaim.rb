class Reclaim < Formula
  desc "Developer-aware Mac cleaner CLI"
  homepage "https://github.com/ImadRashid/reclaim"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_darwin_arm64.tar.gz"
      sha256 "fcb98550441776aa47aaecd75e4c53b144a340bcbd8837677acdf98362ef6540"
    end
    on_intel do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_darwin_amd64.tar.gz"
      sha256 "d8e6867107d25a088c4d0a5341b97e3e40aecdca6fbd1484f926e1692ff78918"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_linux_arm64.tar.gz"
      sha256 "92994286d1e84d2ecd23a46c3581c94a96cc2eefcf1de1df627d512871c0d93d"
    end
    on_intel do
      url "https://github.com/ImadRashid/reclaim/releases/download/v#{version}/reclaim_v#{version}_linux_amd64.tar.gz"
      sha256 "a060303b5e809e2541b1afc74e06cfaad72dd64ba6934b6253cb006c96422f7d"
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
