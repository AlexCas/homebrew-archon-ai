class Omusic < Formula
  desc "Reproductor de música TUI que usa YouTube vía yt-dlp y mpv"
  homepage "https://github.com/AlexCas/omtube"
  version "0.1.0"
  license "MIT"

  depends_on "mpv"
  depends_on "yt-dlp"

  on_macos do
    on_arm do
      url "https://github.com/AlexCas/omtube/releases/download/v0.1.0/omusic_0.1.0_darwin_arm64.tar.gz"
      sha256 "2b626d28efdf8bdae3482f8d5a6160243e3077b0dd6573980f102dc4c4c51343"
    end
    on_intel do
      url "https://github.com/AlexCas/omtube/releases/download/v0.1.0/omusic_0.1.0_darwin_amd64.tar.gz"
      sha256 "104c1249542b1dc2c72b5ff6e16eae131082127ae608c6221d41c3ca51ead96f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AlexCas/omtube/releases/download/v0.1.0/omusic_0.1.0_linux_arm64.tar.gz"
      sha256 "74cb83eb8f518cc426b238e8a4e0f8a7ac6bb31ca7f80942806072a60b01ae9e"
    end
    on_intel do
      url "https://github.com/AlexCas/omtube/releases/download/v0.1.0/omusic_0.1.0_linux_amd64.tar.gz"
      sha256 "960d815b7fa606475cd69e26204fc427af60d1e1d1a86c2dc47333147a570034"
    end
  end

  def install
    bin.install "omusic"
  end

  def caveats
    <<~EOS
      Para el panel de portada instalá chafa (opcional):
        brew install chafa
    EOS
  end

  test do
    assert_match "omusic", shell_output("#{bin}/omusic --version")
  end
end
