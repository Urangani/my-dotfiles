
return {
    "catgoose/nvim-colorizer.lua",
    config = function()
	require("colorizer").setup({
	    filetypes = { "*" }, -- enable for all filetypes
	    user_default_options = {
		RGB = true,          -- #RGB hex codes
		RRGGBB = true,       -- #RRGGBB hex codes
		names = true,        -- "blue", "red", etc.
		RRGGBBAA = true,     -- #RRGGBBAA hex codes
		rgb_fn = true,       -- rgb(), rgba() functions
		hsl_fn = true,       -- hsl(), hsla() functions
		css = true,          -- Enable all CSS features
	    },
	})
    end,
}

