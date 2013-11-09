require 'formula'

class Browsertime < Formula
  homepage 'http://browsertime.net'
  url 'file://browsertime-0.3-SNAPSHOT-distribution.zip'
  sha1 '2bf3d7e978a23f08a7f8e4fa584b667c19f2744b'

  def install
    # Remove windows files
    rm_f Dir["bin/*.bat"]
    
    prefix.install_metafiles
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "browsertime", "--version"
  end
end