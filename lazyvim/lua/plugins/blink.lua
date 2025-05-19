return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      local keymap = opts.keymap or {}
      -- Set <C-e> to {} to explicitly disable blink.cmp's internal mapping for it.
      -- This should prevent blink.cmp from setting it, allowing my global mapping to take over <Esc> to work.
      -- Hint: if this breaks in the future, use ":verbose imap <C-e>" to find out where it's being set.
      keymap["<C-e>"] = {}
      opts.keymap = keymap

      return opts
    end,
  },
}
