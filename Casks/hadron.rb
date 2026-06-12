# Bumped manually from hadron-cli v0.1.0 checksums.txt; once the
# HOMEBREW_TAP_TOKEN secret is configured in hadron-cli, goreleaser
# rewrites this file on every release (see hadron-cli/.goreleaser.yaml).
cask "hadron" do
  version "0.1.0"

  on_intel do
    sha256 "3a483e26d87a4c8b40da658078ba3667759ae612bba9253043c49a6fb97cce59"
    url "https://github.com/hadron-memory/hadron-cli/releases/download/v#{version}/hadron_#{version}_darwin_amd64.tar.gz"
  end
  on_arm do
    sha256 "468bb7d02d9cbd0fb747ed7923d920a539a283bee3b1eedf80170cb84e96befa"
    url "https://github.com/hadron-memory/hadron-cli/releases/download/v#{version}/hadron_#{version}_darwin_arm64.tar.gz"
  end

  name "hadron"
  desc "CLI for the Hadron AI-memory platform"
  homepage "https://hadronmemory.com"

  binary "hadron"

  # The release archives contain unsigned binaries; strip the
  # quarantine attribute so Gatekeeper does not block first run.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/hadron"],
                   must_succeed: false
  end
end
