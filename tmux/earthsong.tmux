# Earthsong tmux theme — minimal, centered tabs
# Role alignment with nvim-earthsong and all other tools:
#   sage      = primary accent   → active tab, borders, clock, cursor
#   clay      = secondary accent → session name, messages
#   oak       = ok/success       → copy mode
#   muted     = dim/inactive     → inactive tabs, time, separators
#   terracotta = error           → (available for future use)

bg="#292520"
surface="#322d27"
overlay="#3c3731"
muted="#675f54"
text="#e5c7a9"
sage="#1398b9"
clay="#d0633d"
oak="#509552"
amber="#f5ae2e"
terracotta="#ff645a"

# Status bar
set -g status-style       "fg=${muted},bg=${surface}"
set -g status-justify     centre
set -g status-left-length 20
set -g status-right-length 20

# Left: session name — clay (secondary, warm accent)
set -g status-left  "#[fg=${clay},bold] #S #[nobold]"

# Right: time — muted (dim, not important)
set -g status-right "#[fg=${muted}] %H:%M "

# Inactive tabs — muted grey, unobtrusive
set -g window-status-format         "#[fg=${muted},bg=${surface}]  #I:#W  "

# Active tab — sage rounded pill (primary accent, cool cyan on warm bg)
set -g window-status-current-format "#[fg=${sage},bg=${surface}]#[fg=${bg},bg=${sage},bold] #I:#W #[fg=${sage},bg=${surface},nobold]"

set -g window-status-separator ""

# Pane borders — inactive dim, active sage (primary)
set -g pane-border-style        "fg=${overlay}"
set -g pane-active-border-style "fg=${sage}"

# Command / message line
set -g message-style         "fg=${text},bg=${overlay}"
set -g message-command-style "fg=${clay},bg=${overlay}"

# Copy mode — oak (matches ok/success signals)
set -g mode-style "fg=${bg},bg=${oak}"

# Clock — sage
set -g clock-mode-colour "${sage}"