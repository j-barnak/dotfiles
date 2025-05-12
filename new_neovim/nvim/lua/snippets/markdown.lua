local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    "ff",
    fmt(
      [[ 
    START
    Basic
    Front: {}
    Back: {}
    TARGET DECK: {}
    END]],
      {
        i(1, "front"),
        i(2, "back"),
        i(3, "target_deck"),
      }
    )
  ),
}
