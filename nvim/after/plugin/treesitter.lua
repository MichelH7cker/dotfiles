require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "bash", "c", "cpp", "csv", "json", "latex", "lua", "make", "markdown", "markdown_inline", "python", "vim", "vimdoc" },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
  },
}

