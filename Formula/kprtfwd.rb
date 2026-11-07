class Kprtfwd < Formula
  desc "Terminal UI and CLI for Kubernetes port forwards"
  homepage "https://github.com/xlttj/kprtfwd"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xlttj/kprtfwd/releases/download/v2.0.0/kprtfwd-darwin-arm64"
      sha256 "46c56ed251d30c6065d33abc82355e2107aabdaa97c93f18dd925aeadc033da8"
    end
    on_intel do
      url "https://github.com/xlttj/kprtfwd/releases/download/v2.0.0/kprtfwd-darwin-amd64"
      sha256 "7305708ccd3a45cd628658bc4f924caf124827e28fe6b6b501bdfcf94acb827b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xlttj/kprtfwd/releases/download/v2.0.0/kprtfwd-linux-arm64"
      sha256 "ef346131876154644406da68eaace8282320d2f1949d3803b54427c3ceb185b6"
    end
    on_intel do
      url "https://github.com/xlttj/kprtfwd/releases/download/v2.0.0/kprtfwd-linux-amd64"
      sha256 "0ef53abef646e1cb6cb4c3c4b946f9af3b22c3c60fd36b1993b3d8f1afbf8ad8"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "kprtfwd-#{os}-#{arch}" => "kprtfwd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kprtfwd --version")
  end
end
