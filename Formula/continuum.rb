# Continuum CLI — a living project brain for AI coding agents.
#
# This formula is auto-bumped by the `bump homebrew tap` job inside
# .github/workflows/release.yml in sudomichael/continuum on every `v*`
# release tag — DO NOT hand-edit the version / sha256 fields. Add Ruby
# helpers or test blocks below the asset block if needed.

class Continuum < Formula
  desc "Living project brain — pairs Claude Code & Codex sessions to your Continuum server"
  homepage "https://getcontinuum.dev"
  version "0.2.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-darwin-arm64"
      sha256 "29725fb066dadb8ca67ca431eacfa8d6fd8f8381c0f7e00c9c5a056c936cd97a"
    end
    on_intel do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-darwin-amd64"
      sha256 "1280ad960eee9839645cbe1593fdc824666088bfe2bf788491a623b12340f970"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-linux-arm64"
      sha256 "3c4ebd76a3f38191b541ed7428fcee1dd547a98c813507e63e0527d69710de43"
    end
    on_intel do
      url "https://github.com/sudomichael/continuum/releases/download/v#{version}/continuum-linux-amd64"
      sha256 "95098fa8bfc2ac450cc2f03def1a40627896c80daa51dd787280fdd39f4d0f49"
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
