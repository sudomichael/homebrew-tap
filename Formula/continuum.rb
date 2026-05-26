# Continuum CLI — a living project brain for AI coding agents.
#
# This formula is auto-bumped by the `bump homebrew tap` job inside
# .github/workflows/release.yml in sudomichael/continuum on every `v*`
# release tag — DO NOT hand-edit the version / sha256 fields. Add Ruby
# helpers or test blocks below the asset block if needed.

class Continuum < Formula
  desc "Living project brain — pairs Claude Code & Codex sessions to your Continuum server"
  homepage "https://getcontinuum.dev"
  version "0.2.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-darwin-arm64"
      sha256 "42443a0c1ffc0125c479d25681f0215515b4709b857e1ab0dda538ca1fab1499"
    end
    on_intel do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-darwin-amd64"
      sha256 "8830d8afa0c4eeea9164fad21d4fc42b0208cc996c2fb1387014108c4997fa60"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-linux-arm64"
      sha256 "4eb17fdae7a3a87e19724c1a543384c1ed4bb4f90cd838b00e4c9c53740dea4b"
    end
    on_intel do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-linux-amd64"
      sha256 "f27ea1a2566ac504a1c26171ac0782a405c4e0933ed505f38f32347f3981883a"
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
