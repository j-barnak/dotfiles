local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    "class",
    fmt(
      [[ 
    class {}
    {{
    {}
    }};]],
      {
        i(1),
        i(2),
      }
    )
  ),

  s(
    "struct",
    fmt(
      [[ 
    struct {}
    {{
        {}
    }};]],
      {
        i(1),
        i(2),
      }
    )
  ),
}
