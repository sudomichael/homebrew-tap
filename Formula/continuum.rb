# Continuum CLI — a living project brain for AI coding agents.
#
# This formula is auto-bumped by the `bump homebrew tap` job inside
# .github/workflows/release.yml in sudomichael/continuum on every `v*`
# release tag — DO NOT hand-edit the version / sha256 fields. Add Ruby
# helpers or test blocks below the asset block if needed.

class Continuum < Formula
  desc "Living project brain — pairs Claude Code & Codex sessions to your Continuum server"
  homepage "https://getcontinuum.dev"
  version "0.1.3"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-darwin-arm64"
      sha256 "3dbcbc5571fd47ea174edeffa1e7e7cf22b992ed389722b5445e00e92726af9e"
    end
    on_intel do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-darwin-amd64"
      sha256 "5a78f8ea8db15b5e26700ddb3cf44dde245dd07592e883bff64e1ab9fd0d7896"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-linux-arm64"
      sha256 "6ea494705ff658cd1b5158f3f69daa73ed897c031a81d3e11ceed3c0f21b953d"
    end
    on_intel do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-linux-amd64"
      sha256 "c2c9a1a2479eeb2c7f837453cc7e80195e15b0ea2499f43a83abdd8837cbc0cb"
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
