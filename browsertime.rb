require 'formula'

class Browsertime < Formula
  homepage 'http://browsertime.net'
  url 'https://github.com/tobli/browsertime/releases/download/browsertime-0.5/browsertime-0.5.zip'
  sha1 '9aa2a4ddafec2c65da29c2de0fe264e25cf6ef2a'

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
