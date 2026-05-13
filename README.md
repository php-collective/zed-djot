# zed-djot

Zed editor support for [djot](https://djot.net/), a modern light markup language created by John MacFarlane.

Syntax highlighting tuned to the [`php-collective/djot-php`](https://github.com/php-collective/djot-php) parser feature set. Paired with the [`djot-watch`](https://php-collective.github.io/djot-php/reference/cli#live-preview-djot-watch) CLI, you get a complete write-and-preview loop without leaving Zed.

## Features

- Tree-sitter highlighting for the full djot spec (headings, emphasis, strong, links, images, lists, tables, divs, math, footnotes, attributes, smart typography).
- Code-block language injections — fenced ` ``` php` blocks get PHP highlighting, ` ``` rust` gets Rust, and so on.
- YAML highlighting inside `---` frontmatter blocks.
- LaTeX highlighting inside `$...$` and `$$...$$` math.
- Bracket matching, autoclose pairs (`[]`, `()`, `{}`, `*`, `_`, `` ` ``).
- Outline view shows your document's heading structure.
- Block-comment toggle uses djot's `{% %}` form.

## Install (dev extension)

The extension is not yet in Zed's official registry. Install it as a dev extension:

1. Clone this repo:
   ```bash
   git clone https://github.com/php-collective/zed-djot.git
   ```
2. In Zed, open the command palette (`Cmd/Ctrl+Shift+P`) and run **`zed: install dev extension`**.
3. Select the cloned `zed-djot` folder.

Zed will fetch the upstream Tree-sitter grammar from [Codeberg](https://codeberg.org/treeman/tree-sitter-djot) on first install. Subsequent installs use the cached grammar.

To verify the install, open any `.djot` file — headings, emphasis, and code blocks should be colored.

## Live preview

Pair this extension with [`vendor/bin/djot-watch`](https://php-collective.github.io/djot-php/reference/cli#live-preview-djot-watch) from `php-collective/djot` for live HTML preview in your browser.

After `composer require php-collective/djot`, add this to your project's `.zed/tasks.json` for one-key preview:

```json
[
    {
        "label": "Djot: Watch current file",
        "command": "vendor/bin/djot-watch",
        "args": ["$ZED_FILE"],
        "cwd": "$ZED_WORKTREE_ROOT",
        "use_new_terminal": true,
        "allow_concurrent_runs": false
    }
]
```

Then `Ctrl+Shift+P` → **`task: spawn`** → pick the task. A browser tab opens at `http://127.0.0.1:8765/` and live-reloads on every save.

## Roadmap

- Submit to the Zed extension registry once the dev-extension period proves out.
- Icon-theme contribution for `.djot` files in the file tree.
- Coverage for djot-php-specific syntax (wikilinks `[[Page]]`, user mentions, abbreviation definitions `*[KEY]:`, fenced comments `%%%`) — pending upstream grammar PRs on [codeberg.org/treeman/tree-sitter-djot](https://codeberg.org/treeman/tree-sitter-djot).

## Credits

- [Jonas Hietala](https://www.jonashietala.se/) — the upstream `tree-sitter-djot` grammar.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter-queries-djot) — Tree-sitter query starting points.
- [PHP Collective](https://github.com/php-collective) — `djot-php` parser and `djot-watch` CLI.

## License

MIT
