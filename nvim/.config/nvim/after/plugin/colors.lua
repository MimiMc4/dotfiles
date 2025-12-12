
function ColorMyPencils(color)
	--vim.api.nvim_set_hl(0,"Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0,"NormalFloat", { bg = "none" })
    --vim.api.nvim_set_hl(0, "Comment", { fg = '#398564' })
    --vim.api.nvim_set_hl(0, "@comment", { link = "Comment"})
end

-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
end

ColorMyPencils()
LineNumberColors()
