require('util.map')

require('hop').setup()

Noremap('<leader>w', '<cmd>lua require(\'hop\').hint_words({ multi_windows = true })<CR>')
Noremap('<leader>f', '<cmd>lua require(\'hop\').hint_char1()<CR>')
Noremap('<leader>s', '<cmd>lua require(\'hop\').hint_char2()<cr>')
