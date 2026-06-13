class Omusic < Formula
  desc "Reproductor de música TUI que usa YouTube vía yt-dlp y mpv"
  homepage "https://github.com/AlexCas/omtube"
  version "0.2.1"
  license "MIT"

  depends_on "mpv"
  depends_on "yt-dlp"

  on_macos do
    on_arm do
      url "https://github.com/AlexCas/omtube/releases/download/v0.2.1/omusic_0.2.1_darwin_arm64.tar.gz"
      sha256 "e3be3fcb5289c52a8218c267b34aeac0b84cc19acbfdfa5772a9e0ec9a133748"
    end
    on_intel do
      url "https://github.com/AlexCas/omtube/releases/download/v0.2.1/omusic_0.2.1_darwin_amd64.tar.gz"
      sha256 "96bc7b48ae7b4a68112ef9a496395011a60535fe158d39c00603d43eb1302b24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AlexCas/omtube/releases/download/v0.2.1/omusic_0.2.1_linux_arm64.tar.gz"
      sha256 "e911885c16321c31764c59bab6c8a9cccefdd30965b3a383c57a8962ae39e392"
    end
    on_intel do
      url "https://github.com/AlexCas/omtube/releases/download/v0.2.1/omusic_0.2.1_linux_amd64.tar.gz"
      sha256 "56eae61f0f809bb297dbd1c5f1f6f46d7684e17d66acb49cac9de4b376a9e187"
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
