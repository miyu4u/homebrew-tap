# typed: false
# frozen_string_literal: true

# Homebrew Formula for markdown-cli (standalone distribution without Node/Bun runtime dependency)
class MarkdownCli < Formula
  desc "Markdown repository inspection and maintenance"
  homepage "https://github.com/miyu4u/homebrew-tap"
  license "MIT"

  depends_on macos: :sequoia

  on_macos do
    on_arm do
      url "https://github.com/miyu4u/homebrew-tap/releases/download/v0.1.0/markdown-cli-v0.1.0-darwin-arm64.tar.gz"
      sha256 "5f9ef22addd065ed49ec4fec10d80c6050ded9386cc8238f4f56e6302829b2b0"
    end
    on_intel do
      url "https://github.com/miyu4u/homebrew-tap/releases/download/v0.1.0/markdown-cli-v0.1.0-darwin-x64.tar.gz"
      sha256 "4cd40d9a6ad08b2dc0c5844ca9a2200e97f1466f52311acbbad4885e22716c94"
    end
  end

  def install
    bin.install "md"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/md --version").strip
    assert_match "md", shell_output("#{bin}/md --help")
    (testpath/"test.md").write("# Test Document\n\nSample markdown content.\n")
    system bin/"md", "--no-config", "--root", testpath, "check-links", "test.md"
  end
end
