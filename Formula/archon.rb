class Archon < Formula
  desc "AI Orchestration Harness CLI - Install structured AI workflows per project"
  homepage "https://github.com/AlexCas/archon-ai"
  url "https://github.com/AlexCas/archon-ai/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "94b44a9e27c4c6061ad4e733451cd3ccf22baff68bb78d5750a462e6f0a08d50"
  version "0.8.0"
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
