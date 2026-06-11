class Archon < Formula
  desc "AI Orchestration Harness CLI - Install structured AI workflows per project"
  homepage "https://github.com/AlexCas/archon-ai"
  version "0.1.0"
  license "MIT"

  # Install from source using master branch
  head "https://github.com/AlexCas/archon-ai.git", branch: "master"

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
