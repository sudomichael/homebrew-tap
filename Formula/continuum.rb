# Continuum CLI — a living project brain for AI coding agents.
#
# This formula is auto-bumped by the `bump homebrew tap` job inside
# .github/workflows/release.yml in sudomichael/continuum on every `v*`
# release tag — DO NOT hand-edit the version / sha256 fields. Add Ruby
# helpers or test blocks below the asset block if needed.

class Continuum < Formula
  desc "Living project brain — pairs Claude Code & Codex sessions to your Continuum server"
  homepage "https://getcontinuum.dev"
  version "0.2.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-darwin-arm64"
      sha256 "28d811522a54de0eb76150a1ad868656834af9e7a238ab85354887683252b895"
    end
    on_intel do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-darwin-amd64"
      sha256 "417805e4c2d8a5e6f3ff6c5760fbb894833505131a662dc856873b3d6320762a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-linux-arm64"
      sha256 "a28ef8071ce4c535a456b956a72dcbe4bb2e0d9c47af8c76756dd4f8e54ff662"
    end
    on_intel do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-linux-amd64"
      sha256 "2febb7f338bb2a58f97aa02ef6d407381587c9617b9833173961683d99d2306c"
    end
  end

  def install
    binary_name = "continuum-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
    bin.install binary_name => "continuum"
  end

  test do
    assert_match "continuum #{version}", shell_output("#{bin}/continuum version")
  end
end
