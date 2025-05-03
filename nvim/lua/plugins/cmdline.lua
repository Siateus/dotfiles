return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        local color9 = vim.g.color9 or "#808080"
        local color5 = vim.g.color5 or "#ffffff"

        require("noice").setup({
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
        })

        -- Definições de cores
        vim.cmd('highlight NoiceCmdlineIcon guifg=' .. color9 .. ' guibg=NONE')
        vim.cmd('highlight NoiceCmdlinePopupBorder guifg=' .. color5 .. ' guibg=NONE')
        vim.cmd('highlight NotifyINFOBorder guifg=' .. color5 .. ' guibg=NONE')
        vim.cmd('highlight NotifyINFOIcon guifg=' .. color9 .. ' guibg=NONE')
        vim.cmd('highlight NotifyINFOTitle guifg=' .. color5 .. ' guibg=NONE')

        -- Transparência geral no Neovim
        vim.cmd [[
            highlight Normal guibg=NONE ctermbg=NONE
            highlight NormalNC guibg=NONE ctermbg=NONE
            highlight EndOfBuffer guibg=NONE ctermbg=NONE
            highlight VertSplit guibg=NONE ctermbg=NONE
            highlight SignColumn guibg=NONE ctermbg=NONE
            highlight MsgArea guibg=NONE ctermbg=NONE
        ]]
    end,
}
