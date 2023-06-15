class Xc < Formula
  desc "Best command to run Xcode app what you want"
  homepage "https://github.com/minacle/xc"
  url "https://github.com/minacle/xc/archive/refs/tags/v0.13.1.tar.gz"
  sha256 "4eb9265c7d9a9f85213f1f8afbd8aac24aa3adbcc51a9a3fbb4a3e70157ebd6e"
  license "Unlicense"

  depends_on xcode: ["14.0", :build]
  depends_on macos: :catalina
  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/xc"
  end

  test do
    system "#{bin}/xc", "help"
  end
end
