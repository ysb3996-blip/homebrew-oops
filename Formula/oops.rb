class Oops < Formula
  desc "Copy the last shell command and its output to the clipboard, secrets masked"
  homepage "https://github.com/ysb3996-blip/oops"
  url "https://github.com/ysb3996-blip/oops/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "9e6b36e3428abbfbe1ea73389b996872e7347784587ccbfd3f2329cf025e9aa2"
  license "MIT"

  depends_on "ruby"

  def install
    # oops has no runtime gem dependencies, so lib/ and exe/ are all it needs.
    # The shebang points at Homebrew's Ruby: the shell hooks run this file by
    # its absolute path, so an older Ruby first on PATH must not be picked.
    inreplace "exe/oops", "#!/usr/bin/env ruby", "#!#{formula_opt_bin("ruby")}/ruby"
    libexec.install "lib", "exe"
    bin.install_symlink libexec/"exe/oops"
  end

  def caveats
    <<~EOS
      Add one line to your rc file, then open a new tab:
        eval "$(oops init zsh)"    # ~/.zshrc
        eval "$(oops init bash)"   # ~/.bashrc
        oops init fish | source    # ~/.config/fish/config.fish
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oops --version")
    assert_match "__oops_preexec", shell_output("#{bin}/oops init zsh")
  end
end
