class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://download.clojure.org/install/clojure-tools-1.10.1.536.tar.gz"
  sha256 "b7c5b0cdeb750275ddd98095a1959657b95569b624da7c6163adce5a7d5f7119"

  devel do
    url "https://download.clojure.org/install/clojure-tools-1.10.1.547.tar.gz"
    sha256 "2012b44ebdb9c7e49bfc03fec9571b88dbc1c1c2e589d4eba2fd3b80c7278f1a"
    version "1.10.1.547"
  end

  bottle :unneeded

  depends_on "rlwrap"

  uses_from_macos "ruby" => :build

  def install
    system "./install.sh", prefix
  end

  test do
    ENV["TERM"] = "xterm"
    system("#{bin}/clj -e nil")
    %w[clojure clj].each do |clj|
      assert_equal "2", shell_output("#{bin}/#{clj} -e \"(+ 1 1)\"").strip
    end
  end
end
