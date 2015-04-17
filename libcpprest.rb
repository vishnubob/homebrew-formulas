class Libcpprest < Formula
  url "https://git.codeplex.com/casablanca", :using => :git, :tag => "v2.5.0"

  depends_on "cmake" => :build
  depends_on "openssl" => :build
  depends_on "boost" => :build

  def install
    # Remove unrecognized options if warned by configure
    system "mkdir build.release"
    system "cd build.release && cmake ../Release -DCMAKE_BUILD_TYPE=Release #{std_cmake_parameters}"
    system "cd build.release && make install"
  end
end
