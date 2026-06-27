class Archon < Formula
  desc "AI Orchestration Harness CLI - Install structured AI workflows per project"
  homepage "https://github.com/AlexCas/archon-ai"
  url "https://github.com/AlexCas/archon-ai/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "ec2c93d0099e5de82fff7cfd0ccdc3a94e223acb41fe2d00fb461bd7f4b5916b"
  version "0.8.2"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", 
      "-ldflags", 
      "-X github.com/archon-ai/archon/internal/version.Version=#{version} -X github.com/archon-ai/archon/internal/version.Commit=brew -X github.com/archon-ai/archon/internal/version.Date=#{Time.now.iso8601}",
      "-o", bin/"archon",
      "./cmd/archon"
  end

  test do
    assert_match "archon version #{version}", shell_output("#{bin}/archon version")
  end
end
