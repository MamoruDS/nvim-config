local config = require("dotfiles.config").config

-- {{#if (eq dark_mode 0)}}
config.appearances.dark_mode = false
-- {{/if}}

-- {{#if (eq use_nerdfont 1)}}
config.appearances.nerdfont = true
-- {{/if}}

-- {{#if (eq nvim_transparent_bg 1)}}
config.appearances.transparent_bg = true
-- {{/if}}
