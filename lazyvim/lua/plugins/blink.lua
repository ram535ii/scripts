return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      local keymap = opts.keymap or {}
      -- Set <C-e> to {} to explicitly disable blink.cmp's internal mapping for it.
      -- This should prevent blink.cmp from setting it, allowing my global mapping to take over <Esc> to work.
      keymap["<C-e>"] = {}
      opts.keymap = keymap

      return opts
    end,
  },
}
