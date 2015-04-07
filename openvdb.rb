# Homebrew formula for OpenVDB
# Written by Giles Hall <giles@polymerase.org>

class Openvdb < Formula
  homepage "http://www.openvdb.org/"
  url "https://github.com/dreamworksanimation/openvdb/archive/v3.0.0.tar.gz"
  version "3.0.0"
  sha256 "6c90cfda032c54876b321031717c13ea56a6b7b15c911d3edfbb2ad7af49700e"

  depends_on "boost" => :build
  depends_on "openexr" => :build
  depends_on "tbb" => :build
  depends_on "glfw3" => :build
  depends_on "cppunit" => :build
  depends_on "log4cplus" => :build
  depends_on "boost-python" => :build
  depends_on "tbb" => :build
  depends_on "jemalloc" => :build
  depends_on "homebrew/python/numpy" => :build


  def install
    system "make", "--directory", "openvdb", "install", 
        "DESTDIR=#{prefix}", 
        "PYTHON_INCL_DIR=#{HOMEBREW_PREFIX}/Frameworks/Python.framework/Headers/",
        "PYTHON_LIB_DIR=#{HOMEBREW_PREFIX}/Frameworks/Python.framework/Versions/Current/lib/",
        "PYTHON_VERSION=2.7",
        "NUMPY_INCL_DIR=#{HOMEBREW_PREFIX}/lib/python2.7/site-packages/numpy/core/include/numpy/",
        "LOG4CPLUS_INCL_DIR=#{HOMEBREW_PREFIX}/include/log4cplus",
        "LOG4CPLUS_LIB_DIR=#{HOMEBREW_PREFIX}/lib",
        "TBB_INCL_DIR=#{HOMEBREW_PREFIX}/include/tbb",
        "TBB_LIB_DIR=#{HOMEBREW_PREFIX}/lib",
        "EXR_INCL_DIR=#{HOMEBREW_PREFIX}/include/OpenEXR",
        "EXR_LIB_DIR=#{HOMEBREW_PREFIX}/lib",
        "GLFW_INCL_DIR=#{HOMEBREW_PREFIX}/include/GLFW",
        "GLFW_LIB_DIR=#{HOMEBREW_PREFIX}/lib",
        "GLFW_LIB=-lglfw3",
        "CPPUNIT_INCL_DIR=#{HOMEBREW_PREFIX}/include/cppunit",
        "CPPUNIT_LIB_DIR=#{HOMEBREW_PREFIX}/lib",
        "BOOST_LIB_DIR=#{HOMEBREW_PREFIX}/lib",
        "BOOST_PYTHON_LIB_DIR=#{HOMEBREW_PREFIX}/lib",
        "BOOST_PYTHON_LIB=-lboost_python-mt",
        "BOOST_THREAD_LIB=-lboost_thread-mt",
        "DOXYGEN=",
        "EPYDOC="
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test openvdb`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
