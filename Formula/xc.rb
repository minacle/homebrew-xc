class Xc < Formula
  desc "Best command to run Xcode app what you want"
  homepage "https://github.com/minacle/xc"
  url "https://github.com/minacle/xc/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "c2f8a23d3fab2725370133e46355f4dcf602dd77f2d077ac9539584a72177f3d"
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
