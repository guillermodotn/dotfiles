# Everforest Light Medium — tmux theme (minimal, centered tabs)
# Palette: https://everforest.vercel.app/palette (light, medium)
#   green   = primary accent  → active tab, borders
#   orange  = secondary       → session name
#   aqua    = ok/success      → copy mode
#   grey1   = dim/inactive    → inactive tabs, time
#   red     = error           → (available)

bg0="#FDF6E3"
bg1="#F4F0D9"
bg2="#EFEBD4"
bg3="#E6E2CC"
bg4="#E0DCC7"
fg="#5C6A72"
green="#8DA101"
orange="#F57D26"
aqua="#35A77C"
blue="#3A94C5"
red="#F85552"
grey1="#939F91"
grey2="#829181"

# Status bar
set -g status-style       "fg=${grey1},bg=${bg2}"
set -g status-justify     centre
set -g status-left-length 20
set -g status-right-length 20

# Left: session name — orange (secondary accent)
set -g status-left  "#[fg=${orange},bold] #S #[nobold]"

# Right: time — grey (dim)
set -g status-right "#[fg=${grey1}] %H:%M "

# Inactive tabs — grey, unobtrusive
set -g window-status-format         "#[fg=${grey1},bg=${bg2}]  #I:#W  "

# Active tab — green rounded pill (primary accent)
set -g window-status-current-format "#[fg=${green},bg=${bg2}]#[fg=${bg0},bg=${green},bold] #I:#W #[fg=${green},bg=${bg2},nobold]"

set -g window-status-separator ""

# Pane borders — inactive light, active green
set -g pane-border-style        "fg=${bg4}"
set -g pane-active-border-style "fg=${green}"

# Command / message line
set -g message-style         "fg=${fg},bg=${bg3}"
set -g message-command-style "fg=${orange},bg=${bg3}"

# Copy mode — aqua
set -g mode-style "fg=${bg0},bg=${aqua}"

# Clock — green
set -g clock-mode-colour "${green}"
