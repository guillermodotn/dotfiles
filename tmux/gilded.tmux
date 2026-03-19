# Gilded tmux theme — minimal, centered tabs
# Role alignment with nvim-gilded and all other tools:
#   gold      = primary accent   → active tab, borders, clock
#   champagne = secondary accent → session name, messages
#   jade      = ok/string        → copy mode
#   subtle    = dim/inactive     → inactive tabs, time, separators
#   crimson   = error            → (available for future use)

bg="#19160f"
surface="#201c14"
overlay="#28241a"
subtle="#706858"
text="#f0e8d8"
silver="#c8be9c"
gold="#c8a038"
champagne="#e8782a"
jade="#28b870"
crimson="#d02848"

# Status bar
set -g status-style       "fg=${subtle},bg=${surface}"
set -g status-justify     centre
set -g status-left-length 20
set -g status-right-length 20

# Left: session name — champagne (secondary, matches tmux session = git role)
set -g status-left  "#[fg=${champagne},bold] #S #[nobold]"

# Right: time — subtle (dim, not important)
set -g status-right "#[fg=${subtle}] %H:%M "

# Inactive tabs — subtle grey, unobtrusive
set -g window-status-format         "#[fg=${subtle},bg=${surface}]  #I:#W  "

# Active tab — gold rounded pill (primary accent, matches btop title/hi_fg, prompt path)
set -g window-status-current-format "#[fg=${gold},bg=${surface}]#[fg=${bg},bg=${gold},bold] #I:#W #[fg=${gold},bg=${surface},nobold]"

set -g window-status-separator ""

# Pane borders — inactive dim, active gold (primary)
set -g pane-border-style        "fg=${overlay}"
set -g pane-active-border-style "fg=${gold}"

# Command / message line
set -g message-style         "fg=${text},bg=${overlay}"
set -g message-command-style "fg=${champagne},bg=${overlay}"

# Copy mode — jade (matches nvim visual/selection, ok signals)
set -g mode-style "fg=${bg},bg=${jade}"

# Clock — gold
set -g clock-mode-colour "${gold}"
