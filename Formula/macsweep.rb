class Macsweep < Formula
  desc "macOS Disk Space Optimizer - Clean caches, Xcode data, and Docker"
  homepage "https://github.com/Viniciuscarvalho/MacSweep"
  url "https://github.com/Viniciuscarvalho/MacSweep/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "b62e66a33eab7a0debee05958103b3b12cde3055da746a58d939dd314a04bbcf"
  license "MIT"
  head "https://github.com/Viniciuscarvalho/MacSweep.git", branch: "main"

  depends_on xcode: ["14.0", :build]
  depends_on macos: :monterey

  def install
    system "swift", "build",
           "--disable-sandbox",
           "--configuration", "release"

    bin.install ".build/release/macsweep"

    # Generate and install shell completions
    generate_completions_from_executable(bin/"macsweep", "--generate-completion-script")
  end

  def caveats
    <<~EOS
      MacSweep has been installed!

      Quick start:
        macsweep              # Scan and show what can be cleaned
        macsweep clean all    # Preview cleanup (dry-run)
        macsweep clean all -x # Actually clean

      For interactive mode:
        macsweep -i

      To schedule automatic cleanup:
        macsweep schedule enable --daily

      Note: Some system caches may require Full Disk Access.
      Go to System Preferences > Security & Privacy > Full Disk Access
      and add Terminal or your terminal emulator.
    EOS
  end

  test do
    assert_match "MacSweep", shell_output("#{bin}/macsweep --version")
  end
end
