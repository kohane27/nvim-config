local wk = require("which-key")
wk.setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20 -- how many suggestions shown in the list
        },
        presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = true, -- default bindings on <c-w>
            nav = true,
            z = true,
            g = true
        }
    },
    key_labels = {
        -- override the label used to display some keys
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["ESC>"] = "ESC",
        ["<bs>"] = "BSPC",
        ["<tab>"] = "TAB"
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>" -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2}, -- extra window padding [top, right, bottom, left]
        winblend = 0
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left" -- align columns left, center or right
    },
        ignore_missing = true, -- hide mappings you didn't specify a label
        hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
        show_help = true, -- help message on the command line when the popup is visible
        triggers = "auto", -- automatically setup triggers
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = {"j", "k"},
        v = {"j", "k"}
    }
}

local opts_n = {
    mode = "n", -- NORMAL mode
    prefix = "",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true
}

local opts_x = {
    mode = "x", -- Visual selected mode
    prefix = "",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true
}

local mappings_n = {
    ["<C-t>"] = {"<cmd>FloatermNew --height=0.4 --width=0.9 --wintype=split --position=botright<cr>", "FloatermNew"},
    ["<C-e>"] = {"<cmd>Executioner<cr>", "Executioner"},
    ["<C-q>"] = { "<cmd>wqa<CR>", "Save and Quit" },
    ["<C-s>"] = { "<cmd>wa<CR>", "Save" },

    g = {
        name = "g",
        -- ["["] = {"<cmd>BufferPrevious<CR>", "previous buffer"},
        -- ["]"] = {"<cmd>BufferNext<CR>", "next buffer"},
        f = {"<cmd>edit <cfile><cr>", "open non-existent files"},
        e = {"<cmd>NvimTreeToggle<cr>", "Explorer"},
    },
    ["<leader>"] = {
        cc = {"<plug>NERDCommenterToggle", "NERDCommenterToggle"},
        q = {"<cmd>sayonara!<cr>", "sayonara"},
        x = {"<cmd>!xdg-open %<cr><cr>", "open current file in default program "},
        t = {
            name = "Terminal",
            -- n = {"<cmd>FloatermNew<cr>", "FloatermNew"},
            n = {"<cmd>FloatermNext<cr>", "FloatermNext"},
            p = {"<cmd>FloatermPrev<cr>", "FloatermPrev"},
            t = {"<cmd>FloatermToggle<cr>", "FloatermToggle"},
            r = {"<cmd>FloatermNew ranger<cr>", "ranger"},
            l = {"<cmd>FloatermNew lazygit<cr>", "lazygit"},
            b = {"<cmd>FloatermNew broot<cr>", "broot"},
            g = {"<cmd>FloatermNew rg<cr>", "rg"}
        },
        s = {
            name = "Search",
            f = {"<cmd>Telescope find_files<cr>", "Find files"},
            F = {"<cmd>Telescope live_grep<cr>", "Find Text"},
            b = {"<cmd>Telescope current_buffer_fuzzy_find fuzzy=true case_mode=ignore_case<cr>", "Buffers"},
            r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
            p = {"<cmd>Telescope projects<cr>", "Projects"},

            -- rarely use
            h = {"<cmd>Telescope help_tags<cr>", "Find Help"},
            M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
            R = {"<cmd>Telescope registers<cr>", "Registers"},
            k = {"<cmd>Telescope keymaps<cr>", "Keymaps"},
            C = {"<cmd>Telescope commands<cr>", "Commands"},

            -- git
            o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
            c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
            B = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        },
        e = {
            name = "executioner",
            e = {"<cmd>Executioner<cr>", "Executioner"},
            h = {"<cmd>ExecutionerHorizontal<cr>", "ExecutionerHorizontal"},
            v = {"<cmd>ExecutionerVertical<cr>", "ExecutionerVertical"}
        },
        w = {
            name = "VimWiki",
            w = {"<cmd>VimwikiIndex<cr>", "open wiki index"},
            d = {"<Plug>VimwikiDeleteFile", "delete current wiki"},
            r = {"<Plug>VimwikiRenameFile", "rename current wiki"}
        },
        u = {
            name = "UndoTree",
            t = {"<cmd>UndotreeToggle<cr>", "UndotreeToggle"}
        },
        n = {
            name = "NvimTree",
            -- t = {"<cmd>NvimTreeToggle<cr>", "NvimTreeToggle"}, -- probably <C-n>
            r = {"<cmd>NvimTreeRefresh<cr>", "NvimTreeRefresh"},
            n = {"<cmd>NvimTreeFindFile<cr>", "NvimTreeFindFile"},
            f = {"<cmd>NvimTreeFocus<cr>", "NvimTreeFocus"}
        },
        v = {
            name = "Config",
            e = {"<cmd>edit ~/.config/nvim/init.vim<cr>", "edit nvim config"},
            r = {"<cmd>source ~/.config/nvim/init.vim<cr>", "source config"},
            w = {"<cmd>edit ~/.config/nvim/plugins/which-key.lua<cr>", "edit which-key config"}
        },
        -- t = {
        --     name = "Telescope",
        --     f = {"<cmd>Telescope find_files<cr>", "find files"},
        --     g = {"<cmd>Telescope live_grep<cr>", "live grep"},
        --     --b = {"<cmd>Telescope buffers<cr>", "buffers"},
        --     b = {"<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<cr>", "fuzzy finder"},
        --     h = {"<cmd>Telescope help_tags<cr>", "live grep"},
        -- },
        h = {
            name = "Harpoon",
            a = {"<cmd>lua require('harpoon.mark').add_file()<CR>", "mark files"},
            m = {"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "view all project marks"},
            n = {"<cmd>lua require('harpoon.ui').nav_next()<CR>", "navigates to next mark"},
            p = {"<cmd>lua require('harpoon.ui').nav_prev()<CR>", "navigates to previous mark"},
            ["1"] = {"<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "navigates to file 1"},
            ["2"] = {"<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "navigates to file 2"},
            ["3"] = {"<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "navigates to file 3"},
            ["4"] = {"<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "navigates to file 4"},
            ["5"] = {"<cmd>lua require('harpoon.ui').nav_file(5)<CR>", "navigates to file 5"}
        },
        m = {
            name = "Markdown",
            d = {"<cmd>InstantMarkdownPreview<cr>", "Previews markdown"},
            s = {"<cmd>InstantMarkdownStop<cr>", "kill previews"}
        }
    }
}

local mappings_x = {
    g = {
        name = "g",
        a = {"<Plug>(EasyAlign)", "EasyAlign"}
    }
}

wk.register(mappings_n, opts_n)
wk.register(mappings_x, opts_x)
