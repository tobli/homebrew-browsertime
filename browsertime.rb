require 'formula'

class Browsertime < Formula
  homepage 'http://browsertime.net'
  url 'https://github.com/tobli/browsertime/releases/download/browsertime-0.3/browsertime-0.3.zip'
  sha1 '82ad5cad81eacf9641227c94ac51a717d841f644'

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