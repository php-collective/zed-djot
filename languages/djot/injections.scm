; Inject the language named in a fenced code block's info string.
(code_block
  (language) @injection.language
  (code) @injection.content)

; Raw blocks carry their target format as the language.
(raw_block
  (raw_block_info
    (language) @injection.language)
  (content) @injection.content)

; Raw inline spans.
(raw_inline
  (content) @injection.content
  (raw_inline_attribute
    (language) @injection.language))

; Frontmatter blocks carry their language (defaults to yaml when bare ---).
(frontmatter
  (language) @injection.language
  (frontmatter_content) @injection.content)

; Math: render with LaTeX highlighting.
(math
  (content) @injection.content
  (#set! injection.language "latex"))
