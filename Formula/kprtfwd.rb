class Kprtfwd < Formula
  desc "Kubernetes port-forward multiplexer"
  homepage "https://github.com/xlttj/kprtfwd"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xlttj/kprtfwd/releases/download/v1.2.0/kprtfwd-darwin-arm64"
      sha256 "bd56cb7ac33ab3f740ad7da804cd6174d46a27d739bec0acc899e6536717d3b2"
    end
    on_intel do
      url "https://github.com/xlttj/kprtfwd/releases/download/v1.2.0/kprtfwd-darwin-amd64"
      sha256 "34f67a7ab222212ecf51e6d915d861f4e016caf7f22a662b2150ffd3710a96aa"
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
