class Omusic < Formula
  desc "Reproductor de música TUI que usa YouTube vía yt-dlp y mpv"
  homepage "https://github.com/AlexCas/omtube"
  version "0.2.0"
  license "MIT"

  depends_on "mpv"
  depends_on "yt-dlp"

  on_macos do
    on_arm do
      url "https://github.com/AlexCas/omtube/releases/download/v0.2.0/omusic_0.2.0_darwin_arm64.tar.gz"
      sha256 "bbd1d99ad0e5b60cc681fc3d002a30effb7b354fd46caecef3daaed2e744d3b0"
    end
    on_intel do
      url "https://github.com/AlexCas/omtube/releases/download/v0.2.0/omusic_0.2.0_darwin_amd64.tar.gz"
      sha256 "2fe2f0c27f3bb6f3473e90f566e5c92d800684a66223cdf2ea5cdba14e2aabcd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AlexCas/omtube/releases/download/v0.2.0/omusic_0.2.0_linux_arm64.tar.gz"
      sha256 "f45eaa1c7dfb0a654a62fa2b0ad6f2c3046d5ecef5a53ac4ed6de431d93f6984"
    end
    on_intel do
      url "https://github.com/AlexCas/omtube/releases/download/v0.2.0/omusic_0.2.0_linux_amd64.tar.gz"
      sha256 "4c63fcef677bbcd5f3ff0558d8e585f8497793f6532f5b3c337378647409dbc6"
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
