# homebrew-oops

Homebrew tap for [oops](https://github.com/ysb3996-blip/oops): copy the last shell command and its output to the clipboard as a Markdown code block, with secrets masked.

```sh
brew install ysb3996-blip/oops/oops
```

Then add one line to your rc file and open a new tab:

```sh
eval "$(oops init zsh)"    # ~/.zshrc
eval "$(oops init bash)"   # ~/.bashrc
```

The formula uses Homebrew's Ruby, so it works even if an older Ruby comes first on your `PATH`. See the [oops README](https://github.com/ysb3996-blip/oops#readme) for where to put the line and how to use it.

---

[oops](https://github.com/ysb3996-blip/oops) の Homebrew tap です。`brew install ysb3996-blip/oops/oops` で入れたあと、rc ファイルに上の 1 行を足して新しいタブを開いてください。Homebrew の Ruby を使うので、`PATH` の先に古い Ruby があっても動きます。
