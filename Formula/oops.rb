class Oops < Formula
  desc "Copy the last shell command and its output to the clipboard, secrets masked"
  homepage "https://github.com/ysb3996-blip/oops"
  url "https://github.com/ysb3996-blip/oops/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5abe89b8f0f7c070f368fcadbcf5a1ba8f3124b92dc81ec3db0703ce658bca1e"
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
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oops --version")
    assert_match "__oops_preexec", shell_output("#{bin}/oops init zsh")
  end
end
