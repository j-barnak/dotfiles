-- Metadata
-- languages: sml
-- url: https://github.com/j-barnak/smlfmt

-- NOTE: Use your own fork of j-barnak of smlfmt

local fs = require("efmls-configs.fs")

local formatter = "smlfmt"
local command = string.format("%s --preview-only ${INPUT}", fs.executable(formatter))

return {
  formatCommand = command,
  formatStdin = true,
}
