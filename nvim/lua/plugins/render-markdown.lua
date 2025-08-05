return {
    'meanderingprogrammer/render-markdown.nvim',
    config = function ()
        vim.treesitter.language.register('markdown', 'telekasten')

        require('render-markdown').setup({
            enabled = false,
            -- render_modes = { 'n', 'c', 't' },
            max_file_size = 10.0,
            debounce = 100,
            file_types = { 'markdown', 'telekasten' },
            link = {
                enabled = true,
                footnote = {
                    enabled = true,
                    superscript = true,
                    prefix = '',
                    suffix = '',
                },
                highlight = 'RenderMarkdownLink',
            },
            latex = {
                enabled = false,
            },
            checkbox = {
                enabled = true,
                render_modes = false,
                bullet = false,
                right_pad = 1,
                unchecked = {
                    -- icon = '󰄱 ',
                    highlight = 'RenderMarkdownUnchecked',
                    scope_highlight = nil,
                },
                checked = {
                    -- icon = '󰱒 ',
                    highlight = 'RenderMarkdownChecked',
                },
                custom = {
                    todo = {
                        raw = '[-]',
                        -- rendered = '',
                        highlight = 'RenderMarkdownTodo',
                        scope_highlight = nil,
                    },
                },
            },
            bullet = {
                enabled = true,
                render_modes = false,
                icons = { '●', '○', '◆', '◇' },
                ordered_icons = function (ctx)
                    local value = vim.trim(ctx.value)
                    local index = tonumber(value:sub(1, #value - 1))
                    return ('%d'):format(index > 1 and index or ctx.index)
                end,
                left_pad = 0,
                right_pad = 0,
                highlight = 'RenderMarkdownBullet',
                scope_highlight = {},
            },
            -- quote = { icon = '▋' },
            anti_conceal = {
                enabled = true,
                ignore = {
                    code_background = true,
                    sign = true,
                },
                above = 0,
                below = 0,
            },
            custom = {
            },
            callout = {
                -- Callouts are a special instance of a 'block_quote' that start with a 'shortcut_link'.
                -- The key is for healthcheck and to allow users to change its values, value type below.
                -- | raw        | matched against the raw text of a 'shortcut_link', case insensitive |
                -- | rendered   | replaces the 'raw' value when rendering                             |
                -- | highlight  | highlight for the 'rendered' text and quote markers                 |
                -- | quote_icon | optional override for quote.icon value for individual callout       |
                -- | category   | optional metadata useful for filtering                              |

                note      = { raw = '[!NOTE]',      rendered = '󰋽 Note',      highlight = 'RenderMarkdownInfo'},
                tip       = { raw = '[!TIP]',       rendered = '󰌶 Tip',       highlight = 'RenderMarkdownSuccess'},
                important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint'},
                warning   = { raw = '[!WARNING]',   rendered = '󰀪 Warning',   highlight = 'RenderMarkdownWarn'},
                caution   = { raw = '[!CAUTION]',   rendered = '󰳦 Caution',   highlight = 'RenderMarkdownError'},
                abstract  = { raw = '[!ABSTRACT]',  rendered = '󰨸 Abstract',  highlight = 'RenderMarkdownInfo'},
                summary   = { raw = '[!SUMMARY]',   rendered = '󰨸 Summary',   highlight = 'RenderMarkdownInfo'},
                tldr      = { raw = '[!TLDR]',      rendered = '󰨸 Tldr',      highlight = 'RenderMarkdownInfo'},
                info      = { raw = '[!INFO]',      rendered = '󰋽 Info',      highlight = 'RenderMarkdownInfo'},
                todo      = { raw = '[!TODO]',      rendered = '󰗡 Todo',      highlight = 'RenderMarkdownInfo'},
                hint      = { raw = '[!HINT]',      rendered = '󰌶 Hint',      highlight = 'RenderMarkdownSuccess'},
                success   = { raw = '[!SUCCESS]',   rendered = '󰄬 Success',   highlight = 'RenderMarkdownSuccess'},
                check     = { raw = '[!CHECK]',     rendered = '󰄬 Check',     highlight = 'RenderMarkdownSuccess'},
                done      = { raw = '[!DONE]',      rendered = '󰄬 Done',      highlight = 'RenderMarkdownSuccess'},
                question  = { raw = '[!QUESTION]',  rendered = '󰘥 Question',  highlight = 'RenderMarkdownWarn'},
                help      = { raw = '[!HELP]',      rendered = '󰘥 Help',      highlight = 'RenderMarkdownWarn'},
                faq       = { raw = '[!FAQ]',       rendered = '󰘥 Faq',       highlight = 'RenderMarkdownWarn'},
                attention = { raw = '[!ATTENTION]', rendered = '󰀪 Attention', highlight = 'RenderMarkdownWarn'},
                failure   = { raw = '[!FAILURE]',   rendered = '󰅖 Failure',   highlight = 'RenderMarkdownError'},
                fail      = { raw = '[!FAIL]',      rendered = '󰅖 Fail',      highlight = 'RenderMarkdownError'},
                missing   = { raw = '[!MISSING]',   rendered = '󰅖 Missing',   highlight = 'RenderMarkdownError'},
                danger    = { raw = '[!DANGER]',    rendered = '󱐌 Danger',    highlight = 'RenderMarkdownError'},
                error     = { raw = '[!ERROR]',     rendered = '󱐌 Error',     highlight = 'RenderMarkdownError'},
                bug       = { raw = '[!BUG]',       rendered = '󰨰 Bug',       highlight = 'RenderMarkdownError'},
                example   = { raw = '[!EXAMPLE]',   rendered = '󰉹 Example',   highlight = 'RenderMarkdownHint' },
                quote     = { raw = '[!QUOTE]',     rendered = '󱆨 Quote',     highlight = 'RenderMarkdownQuote'},
                cite      = { raw = '[!CITE]',      rendered = '󱆨 Cite',      highlight = 'RenderMarkdownQuote'},
            },
        })
    end,
    dependencies = {
    }
}
