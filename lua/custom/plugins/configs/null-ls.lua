local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  -- filetypes = { "html", "markdown", "css" , ""},
  b.formatting.prettier.with {
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      "html",
      "json",
      "jsonc",
      "yaml",
      "markdown",
      "markdown.mdx",
      "graphql",
      "handlebars",
    },
  }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
  b.formatting.fixjson,

  -- python
  b.formatting.yapf,
  b.diagnostics.flake8,
  -- b.diagnostics.pylint, -- too much useless linting (maybe looking for more sane config)
}

null_ls.setup {
  debug = false, -- makes a many-line file
  sources = sources,
}
