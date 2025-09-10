class Kprtfwd < Formula
  desc "Kubernetes port-forward multiplexer"
  homepage "https://github.com/xlttj/kprtfwd"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xlttj/kprtfwd/releases/download/v1.0.0/kprtfwd-darwin-arm64"
      sha256 "3bb9a90db8b382cf511b319a6b5a152da9429dbc222b7e5859fa88494ee163fa"
    end
    on_intel do
      url "https://github.com/xlttj/kprtfwd/releases/download/v1.0.0/kprtfwd-darwin-amd64"
      sha256 "2c3d559bddf1588159df500d25648475a21d788a190f35cf34028e33d4799be6"
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

