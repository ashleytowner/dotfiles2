-- CamelCase motions
vim.keymap.set(
	'',
	',w',
	'<Plug>CamelCaseMotion_w'
);

vim.keymap.set(
	'',
	',b',
	'<Plug>CamelCaseMotion_b'
);

vim.keymap.set(
	'',
	',e',
	'<Plug>CamelCaseMotion_e'
);

vim.keymap.set(
	'',
	'g,e',
	'<Plug>CamelCaseMotion_ge'
);

vim.keymap.set(
	{ 'x', 'o' },
	'i,w',
	'<Plug>CamelCaseMotion_iw'
);

vim.keymap.set(
	{ 'x', 'o' },
	'i,b',
	'<Plug>CamelCaseMotion_ib'
);

vim.keymap.set(
	{ 'x', 'o' },
	'i,e',
	'<Plug>CamelCaseMotion_ie'
);

