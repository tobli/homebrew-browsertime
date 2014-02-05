require 'formula'

class Browsertime < Formula
  homepage 'http://browsertime.net'
  url 'https://github.com/tobli/browsertime/releases/download/browsertime-0.6/browsertime-0.6.zip'
  sha1 '55e39c27fecad8f9fbedabcb3a00d67c77f02698'

  depends_on 'chromedriver'

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
