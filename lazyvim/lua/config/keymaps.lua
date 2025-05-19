-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set({ "i", "v", "n" }, "<C-e>", "<Esc>", { desc = "Exit current mode" })
vim.keymap.set("n", "<leader><leader>", ":e #<CR>", { desc = "Swap between last two buffers" })
vim.keymap.set("v", "<leader>yy", '"+y', { desc = "Copy to clipboard" })

-- This keymap is pretty bespoke to wearedev.
vim.keymap.set("n", "<leader>fs", function()
  local get_one_level_deeper_path = function(cwd, file_path)
    -- Step 1: Remove the cwd prefix from file_path. We assume file_path starts with cwd.
    local relative_path = file_path:sub(#cwd + 1)

    -- Step 2: Split the remaining path by '/' and take the first element.
    -- A simple split function is needed.
    local function split(s, delimiter)
      local result = {}
      local from = 1
      local delim_len = #delimiter
      while true do
        local to = s:find(delimiter, from, true)
        if to then
          table.insert(result, s:sub(from, to - 1))
          from = to + delim_len
        else
          table.insert(result, s:sub(from))
          break
        end
      end
      return result
    end

    local path_components = split(relative_path, "/")

    -- This bit will contain 'service.bla' or 'libraries'. Not sure why it's element 2 though...
    local first_element = path_components[2] or ""

    -- Step 3: Append that first element onto the cwd with a '/'
    -- Ensure cwd ends with a slash before appending, unless it's the root.
    local new_path = cwd .. "/" .. first_element .. "/"

    -- Step 4: Return that value
    return new_path
  end

  local cwd = vim.fn.getcwd()
  local file_path = vim.fn.expand("%:p")
  local new_path = get_one_level_deeper_path(cwd, file_path)
  require("lazyvim.util.pick").open("files", { cwd = new_path })
end, {
  desc = "Find within service",
})
