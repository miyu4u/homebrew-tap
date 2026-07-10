class TossInvestCli < Formula
  desc "CLI for the Toss Invest OpenAPI"
  homepage "https://github.com/miyu4u/toss-invest-cli"
  url "https://github.com/miyu4u/toss-invest-cli", branch: "main", using: :git
  version "0.0.1"
  license "MIT"
  
  depends_on "bun"

  def install
    ENV["BUN_INSTALL_CACHE_DIR"] = buildpath/"bun-cache"

    system "bun", "install", "--frozen-lockfile", "--production"
    system "bun", "run", "build"

    bin.install "dist/toss-invest-cli"
  end

  test do
    assert_match "Usage: toss-invest-cli", shell_output("#{bin}/toss-invest-cli --help")
  end
end
