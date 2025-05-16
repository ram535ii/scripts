-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
--
local jobstart = function(cmd)
    local output = {}
    local function handle_output(_, data)
      if data then
        vim.list_extend(
          output,
          vim.tbl_filter(function(line)
            return line ~= ""
          end, data)
        )
      end
    end

    vim.fn.jobstart(cmd, {
      stdout_buffered = true,
      stderr_buffered = true,
      on_stdout = handle_output,
      on_stderr = handle_output,
      on_exit = function(_, exit_code)
        table.insert(output, exit_code == 0 and "🏁 Command finished successfully" or "🏴‍☠️ Command finished with errors")
        vim.notify(table.concat(output, "\n"), exit_code == 0 and vim.log.levels.INFO or vim.log.levels.ERROR)
      end,
    })
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.proto",
  group = vim.api.nvim_create_augroup("protobufGeneration", { clear = true }), callback = function(_)
    local cwd = vim.fn.getcwd()
    local service = vim.fn.expand("%:p"):match("wearedev/(.+)/proto")
    local cmd = string.format("%s/bin/generate_protobufs %s/%s", cwd, cwd, service)


		local startMsg = string.format("🦾 Regenerating protos for %s...", service)
		vim.notify(startMsg, vim.log.levels.INFO)
		jobstart(cmd)
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = ".CODEOWNERS.template",
  group = vim.api.nvim_create_augroup("codeownerTemplateGeneration", { clear = true }),
  callback = function(_)
    local cwd = vim.fn.getcwd()
    local cmd = string.format("%s/bin/generate_codeowners", cwd)

		vim.notify("🦾 Regenerating CODEOWNERS...", vim.log.levels.INFO)
		jobstart(cmd)
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "{service,cron}.*/manifests/{custom,s101,prod}/*.{yml,yaml}",
  group = vim.api.nvim_create_augroup("generateManifests", { clear = true }),
  callback = function(_)
    local cwd = vim.fn.getcwd()
    local service = vim.fn.expand("%:p"):match("wearedev/(.+)/manifests")
    local cmd = string.format("%s/bin/generate_protobufs %s/%s", cwd, cwd, service)

		vim.notify("🦾 Regenerating Manifests...", vim.log.levels.INFO)
		jobstart(cmd)
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "service.*/crons/crons.go",
  group = vim.api.nvim_create_augroup("generateCrons", { clear = true }),
  callback = function(_)
    local cwd = vim.fn.getcwd()
    local service = vim.fn.expand("%:p"):match("wearedev/(.+)/crons")
    local cmd = string.format("go generate %s/%s/...", cwd, service)

		vim.notify("🦾 Regenerating Crons... (this takes a minute ⏳)", vim.log.levels.INFO)
		jobstart(cmd)
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "service.*/domain/*.go",
  group = vim.api.nvim_create_augroup("generateDaos", { clear = true }),
  callback = function(_)
    local service = vim.fn.expand("%:p"):match("wearedev/(.+)/domain")
    local cmd = string.format("svcgen gen-dao %s", service)

		vim.notify("🦾 Regenerating DAOs...", vim.log.levels.INFO)
		jobstart(cmd)
  end,
})
