local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local l = require('luasnip.extras').lambda
local fmt = require('luasnip.extras.fmt').fmt
local ts_post  = require('luasnip.extras.treesitter_postfix').treesitter_postfix

return {
    ts_post({
        matchTSNode = {
            query = [[
                (function_definition
                    parameters: (parameters) @params
                    return_type: (type) @return
                ) @prefix
            ]],
            query_lang = "python",
        },
        trig = "docstring",
    }, fmt([[
        ''' {}

        Parameters:
            {} () -

        Returns:
            {} -
            {}
        '''
    ]], {
        i(1),
        l(l.LS_TSCAPTURE_PARAMS),
        l(l.LS_TSCAPTURE_RETURN),
        l(l.LS_TSDATA),
    })),
    s(
        { trig = "thingy" },
        { t('Woot!') }
    ),
    s(
        { trig = 'thingy2' },
        { t('Woot2!') }
    )
}
