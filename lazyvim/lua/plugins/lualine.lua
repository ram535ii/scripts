----- @brief Removes the 'diff' component from lualine_x to prevent potential index.lock issues.
--- This function is designed to be used within the `opts` table of the lualine.nvim plugin specification.
--- It receives the currently resolved options and filters out the 'diff' component from lualine_x.
--- @param plugin_spec table The plugin's specification table (unused, but convention for `opts` function).
--- @param opts table The current lualine.nvim options.
--- @return table The modified lualine.nvim options.
local function remove_lualine_diff_to_prevent_index_locks(plugin_spec, opts)
  -- Ensure the sections and lualine_x exist and are tables
  if opts and opts.sections and opts.sections.lualine_x and type(opts.sections.lualine_x) == "table" then
    local new_lualine_x = {}
    for _, component_item in ipairs(opts.sections.lualine_x) do
      -- Check if the component is a table AND its first element is the string "diff"
      -- This reliably identifies the lualine 'diff' component structure.
      if type(component_item) == "table" and component_item[1] == "diff" then
        -- This is the "diff" component, so we skip it (don't add it to new_lualine_x)
      else
        -- Keep all other components (simple strings or other complex tables)
        table.insert(new_lualine_x, component_item)
      end
    end
    opts.sections.lualine_x = new_lualine_x
  end

  return opts
end

return {
  "nvim-lualine/lualine.nvim",
  opts = remove_lualine_diff_to_prevent_index_locks,
}
