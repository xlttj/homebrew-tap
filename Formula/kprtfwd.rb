class Kprtfwd < Formula
  desc "Kubernetes port-forward multiplexer"
  homepage "https://github.com/xlttj/kprtfwd"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xlttj/kprtfwd/releases/download/v1.1.0/kprtfwd-darwin-arm64"
      sha256 "1ee147034074d61c78dd3c28eca6bdcc2a3544e677580eacfb7f47d6f0138230"
    end
    on_intel do
      url "https://github.com/xlttj/kprtfwd/releases/download/v1.1.0/kprtfwd-darwin-amd64"
      sha256 "b3761bbe0fba38a7c071ed1a237cc83bb3e93819eb617c8f397d3e10d21b8f17"
    end
  end

  def install
    fname = Hardware::CPU.arm? ? "kprtfwd-darwin-arm64" : "kprtfwd-darwin-amd64"
    bin.install fname => "kprtfwd"
  end

  test do
    output = shell_output("#{bin}/kprtfwd --help 2>&1")
    assert_match "kprtfwd", output
  end
end

