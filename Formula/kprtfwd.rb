class Kprtfwd < Formula
  desc "Kubernetes port-forward multiplexer"
  homepage "https://github.com/xlttj/kprtfwd"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xlttj/kprtfwd/releases/download/v1.3.0/kprtfwd-darwin-arm64"
      sha256 "69c8a59e5dda0aba8eb0bc2228667aaf4e4722f81f73984d29ac4d13959fec71"
    end
    on_intel do
      url "https://github.com/xlttj/kprtfwd/releases/download/v1.3.0/kprtfwd-darwin-amd64"
      sha256 "dc4220ba4326e26b3580f9331ca8534ef42aa0c57f5e6b45b56aa8d9a3d9afb5"
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
