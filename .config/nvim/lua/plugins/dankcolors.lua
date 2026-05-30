return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#1e2030',
				base01 = '#1e2030',
				base02 = '#92969e',
				base03 = '#92969e',
				base04 = '#eff4ff',
				base05 = '#f8faff',
				base06 = '#f8faff',
				base07 = '#f8faff',
				base08 = '#ff9fba',
				base09 = '#ff9fba',
				base0A = '#a0bfff',
				base0B = '#a5ffb3',
				base0C = '#cdddff',
				base0D = '#a0bfff',
				base0E = '#b1cbff',
				base0F = '#b1cbff',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#92969e',
				fg = '#f8faff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#a0bfff',
				fg = '#1e2030',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#92969e' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#cdddff', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#b1cbff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#a0bfff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#a0bfff',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#cdddff',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#a5ffb3',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#eff4ff' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#eff4ff' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#92969e',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
