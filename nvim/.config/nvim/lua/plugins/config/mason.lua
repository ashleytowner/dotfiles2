local masonOk, mason = pcall(require, 'mason')

if not masonOk then
	print("Mason couldn't be loaded!")
	return
end

mason.setup()
