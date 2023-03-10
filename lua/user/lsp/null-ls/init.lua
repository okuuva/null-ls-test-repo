local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions

local darker = require("user.lsp.null-ls.custom.formatting.darker")

null_ls.setup({
  debug = true,
  sources = {
    -- Code actions
    code_actions.shellcheck,

    -- Diagnostics
    diagnostics.fish,

    -- Formatting
    -- TODO: figure out dynamic conditions once darker plays ball
    -- formatting.black.with({
    --   cwd = function(params)
    --     return vim.fn.fnamemodify(params.bufname, ":h")
    --   end,
    --   extra_args = { "--fast" },
    -- }),
    formatting.jq,
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    formatting.stylua,
    formatting.shfmt,
    darker,
  },
})
