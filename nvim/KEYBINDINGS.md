# Keybindings de Neovim

## Base

- `mapleader`: ` ` (espacio)

## Keymaps

| Modo | Tecla | Acción | Origen |
|---|---|---|---|
| Normal | `<M-h>` | Buffer anterior (`:bprev`) | `.config/nvim/init.lua` |
| Normal | `<M-l>` | Buffer siguiente (`:bnext`) | `.config/nvim/init.lua` |
| Normal | `<leader>a` | Añadir archivo actual a Harpoon | `.config/nvim/lua/plugins/harpoon.lua` |
| Normal | `<C-e>` | Abrir/cerrar menú rápido de Harpoon | `.config/nvim/lua/plugins/harpoon.lua` |
| Normal | `<leader>p` | Ir al elemento previo de Harpoon | `.config/nvim/lua/plugins/harpoon.lua` |
| Normal | `<leader>n` | Ir al siguiente elemento de Harpoon | `.config/nvim/lua/plugins/harpoon.lua` |
| Normal | `K` | LSP hover | `.config/nvim/lua/plugins/lsp-config.lua` |
| Normal | `gd` | LSP: ir a definición | `.config/nvim/lua/plugins/lsp-config.lua` |
| Normal | `gD` | LSP: ir a declaración | `.config/nvim/lua/plugins/lsp-config.lua` |
| Normal | `<leader>ca` | LSP code action | `.config/nvim/lua/plugins/lsp-config.lua` |
| Normal | `<C-p>` | Telescope: buscar archivos (`find_files`) | `.config/nvim/lua/plugins/telescope.lua` |
| Normal | `<leader>fg` | Telescope: búsqueda global (`live_grep`) | `.config/nvim/lua/plugins/telescope.lua` |
| Normal | `<C-n>` | Neo-tree: abrir/revelar filesystem a la izquierda | `.config/nvim/lua/plugins/neo-tree.lua` |
| Normal | `<C-m>` | Neo-tree: cerrar | `.config/nvim/lua/plugins/neo-tree.lua` |
| Normal | `<M-p>` | Iniciar `present.nvim` (`:PresentStart`) | `.config/nvim/lua/plugins/presentations.lua` |

## Notas

- En `init.lua` también tienes:
  - `set <M-h>=\eh`
  - `set <M-l>=\el`
  - `set <M-p>=\\ep`

  Estas líneas ayudan a que Neovim interprete correctamente `Alt` (`Meta`) para `<M-h>` y `<M-l>`.

- Ya no hay conflicto en `<leader>p` con `present.nvim`: presentación quedó en `<M-p>`.
