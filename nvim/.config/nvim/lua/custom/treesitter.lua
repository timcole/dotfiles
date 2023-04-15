local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
  vim.notify("nvim-treesitter not found!")
  return
end

configs.setup {
  sync_install = false,
  ensure_installed = { "vimdoc", "javascript", "typescript", "yaml", "json", "lua", "rust" },
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
    use_languagetree = true,
  },
}
