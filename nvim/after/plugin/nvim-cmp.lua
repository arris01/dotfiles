local cmp = require'cmp'

cmp.setup({
 -- Your existing configuration here...
 mapping = {
  ['<Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      fallback()
    end
  end, { 'i', 's' }),
 },
})

