# Tokyo Night Storm — tmux theme (minimal, centered tabs)
# Role alignment with folke/tokyonight.nvim:
#   blue    = primary accent  → active tab, borders, clock
#   purple  = secondary       → session name
#   green   = success/ok      → copy mode
#   comment = dim/inactive    → inactive tabs, time
#   red     = error           → (available for future use)

bg="#24283b"
bg_dark="#1f2335"
bg_highlight="#292e42"
comment="#565f89"
fg="#c0caf5"
fg_dark="#a9b1d6"
blue="#7aa2f7"
purple="#bb9af7"
green="#9ece6a"
orange="#ff9e64"
red="#f7768e"
black="#1d202f"

# Status bar
set -g status-style       "fg=${comment},bg=${bg_dark}"
set -g status-justify     centre
set -g status-left-length 20
set -g status-right-length 20

# Left: session name — purple (secondary accent)
set -g status-left  "#[fg=${purple},bold] #S #[nobold]"

# Right: time — comment (dim)
set -g status-right "#[fg=${comment}] %H:%M "

# Inactive tabs — dim, unobtrusive
set -g window-status-format         "#[fg=${comment},bg=${bg_dark}]  #I:#W  "

# Active tab — blue rounded pill (primary accent)
set -g window-status-current-format "#[fg=${blue},bg=${bg_dark}]#[fg=${black},bg=${blue},bold] #I:#W #[fg=${blue},bg=${bg_dark},nobold]"

set -g window-status-separator ""

# Pane borders — inactive dim, active blue
set -g pane-border-style        "fg=${bg_highlight}"
set -g pane-active-border-style "fg=${blue}"

# Command / message line
set -g message-style         "fg=${blue},bg=${bg_highlight}"
set -g message-command-style "fg=${orange},bg=${bg_highlight}"

# Copy mode — green (success)
set -g mode-style "fg=${black},bg=${green}"

# Clock — blue
set -g clock-mode-colour "${blue}"
