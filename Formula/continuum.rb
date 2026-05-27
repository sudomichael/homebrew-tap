# Continuum CLI — a living project brain for AI coding agents.
#
# This formula is auto-bumped by the `bump homebrew tap` job inside
# .github/workflows/release.yml in sudomichael/continuum on every `v*`
# release tag — DO NOT hand-edit the version / sha256 fields. Add Ruby
# helpers or test blocks below the asset block if needed.

class Continuum < Formula
  desc "Living project brain — pairs Claude Code & Codex sessions to your Continuum server"
  homepage "https://getcontinuum.dev"
  version "0.2.3"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-darwin-arm64"
      sha256 "4751563a839e9d3d33626c99624651f30caabba930f706c049ac1846ee181a13"
    end
    on_intel do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-darwin-amd64"
      sha256 "a1f316c9825fac0a652d53b816d8b3fcc5da02882aed779b7ec871a496f7f324"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-linux-arm64"
      sha256 "94ef61fa503295f9b373ad52e1eba9bb91d4a9e86670c8dbf5cdeaeb172d7dee"
    end
    on_intel do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-linux-amd64"
      sha256 "626467d57ed9c6538ca5ca05ae4f20515b27b5d65edb8fd41402ed9c936851d4"
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
