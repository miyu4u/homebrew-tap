class Recurl < Formula
  desc "Curl-compatible CLI with output formatting and optional browser rendering"
  homepage "https://github.com/miyu4u/recurl"
  url "git@github.com:miyu4u/recurl.git", branch: "main", using: :git
  version "0.0.1"
  license "MIT"

  depends_on "bun"

  def install
    ENV["BUN_INSTALL_CACHE_DIR"] = buildpath/"bun-cache"

    system "bun", "install", "--frozen-lockfile", "--production"
    system "bun", "run", "build"

    bin.install "dist/recurl"
  end

  test do
    assert_equal "0.0.1\n", shell_output("#{bin}/recurl --recurl-version")
  end
end
