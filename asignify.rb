class Asignify < Formula
  desc "Yet another signify tool"
  homepage "https://github.com/vstakhov/asignify"
  head "https://github.com/vstakhov/asignify.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build


  def install
    system "./autogen.sh"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
    man1.install "docs/asignify.1"

  end

  test do
    system "#{bin}/asignify generate -n foo"
  end
end
