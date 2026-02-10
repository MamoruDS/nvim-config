local augend = require("dial.augend")

require("dial.config").augends:register_group({
  default = {
    augend.integer.alias.decimal_int,
    augend.integer.alias.hex,
    augend.constant.alias.bool,
    augend.constant.alias.Bool,
    augend.constant.alias.en_weekday,
    augend.constant.alias.ja_weekday,
  },
})
