# Continuum CLI — a living project brain for AI coding agents.
#
# This formula is auto-bumped by the .github/workflows/homebrew.yml workflow
# in sudomichael/continuum on every `v*` release tag — DO NOT hand-edit the
# version / sha256 fields. Add Ruby helpers or test blocks below the asset
# block if needed.

class Continuum < Formula
  desc "Living project brain — pairs Claude Code & Codex sessions to your Continuum server"
  homepage "https://getcontinuum.dev"
  version "0.1.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-darwin-arm64"
      sha256 "685c0525077c5f58a1b7f353a3cf5d84ac91c7b101db51907d0b902826894e0a"
    end
    on_intel do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-darwin-amd64"
      sha256 "167bb38854170614918006526a08aeba12faff19de0452d2dd8ff674ea036547"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-linux-arm64"
      sha256 "f6e01bddfaaa005886046f51d48f0beafdfadef9335508c6bd1a29831a9fd2da"
    end
    on_intel do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-linux-amd64"
      sha256 "b4afd8c688a68ff14f1e6b07e91f671435fe434508bf542f04cfbeefd6315a98"
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
