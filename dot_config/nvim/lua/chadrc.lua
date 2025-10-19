-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",
  transparency = true,

  hl_override = {
    NvimTreeCursorLine = {
      bg = "#1a1a1a",
    }
  }
}

M.nvdash = {
  load_on_startup = true,

  -- see https://fsymbols.com/text-art/
  -- see https://textart.sh/
  -- see https://patorjk.com/software/taag/#p=testall&h=0&c=echo&f=Big&t=Type%20Something%20
  -- see https://github.com/NvChad/NvChad/issues/1930#issuecomment-1510511603
  -- see https://github.com/NvChad/base46/blob/v2.0/lua/base46/themes/onedark.lua
  header = {

    [[          ############                                                             ]],
    [[       #################                                                           ]],
    [[     ######       ######                                                           ]],
    [[    ###               ####                                                         ]],
    [[   ###        ###      ####                                                        ]],
    [[  ###       ###         ###                               ##                       ]],
    [[  ###      ###          ###      ##            ##        ####                      ]],
    [[  ###      ###         ###       ##            ##         ##                       ]],
    [[  ###      ###       ###         ##            ##                       ###        ]],
    [[  ###       ##########      #######   ######   ########  ####  ######   ########   ]],
    [[  ####         ####        ##  ####  ###  ###  #### ####  ##  ##   ###  ###  ####  ]],
    [[   #####                  ##    ###  ##    ##  ###   ###  ##        ##  ##    ###  ]],
    [[    ####                  ##     ##  ########  ##     ##  ##   #######  ##     ##  ]],
    [[      ####                ##     ##  ##        ##     ##  ##  ##   ###  ##     ##  ]],
    [[        #####             ##     ##  ##        ##     ##  ##  ##    ##  ##     ##  ]],
    [[          #####           ###   ###  ###   ##  ###   ##   ##  ###  ###  ##     ##  ]],
    [[              #####        ########   ######   #######   #### ########  ##     ##  ]],

  }
}

return M
