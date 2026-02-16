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
| Normal | `<leader>xx` | Trouble: toggle diagnósticos | `.config/nvim/lua/plugins/trouble.lua` |
| Normal | `<leader>xw` | Trouble: diagnósticos del buffer actual | `.config/nvim/lua/plugins/trouble.lua` |
| Normal | `<leader>xq` | Trouble: quickfix list | `.config/nvim/lua/plugins/trouble.lua` |
| Normal | `<leader>xl` | Trouble: location list | `.config/nvim/lua/plugins/trouble.lua` |
| Normal | `<leader>xr` | Trouble: referencias LSP | `.config/nvim/lua/plugins/trouble.lua` |
| Normal | `<F5>` | DAP: continuar/iniciar depuración | `.config/nvim/lua/plugins/dap.lua` |
| Normal | `<F10>` | DAP: step over | `.config/nvim/lua/plugins/dap.lua` |
| Normal | `<F11>` | DAP: step into | `.config/nvim/lua/plugins/dap.lua` |
| Normal | `<F12>` | DAP: step out | `.config/nvim/lua/plugins/dap.lua` |
| Normal | `<leader>db` | DAP: toggle breakpoint | `.config/nvim/lua/plugins/dap.lua` |
| Normal | `<leader>dB` | DAP: breakpoint condicional | `.config/nvim/lua/plugins/dap.lua` |
| Normal | `<leader>dr` | DAP: abrir REPL | `.config/nvim/lua/plugins/dap.lua` |
| Normal | `<leader>dt` | DAP: terminar sesión | `.config/nvim/lua/plugins/dap.lua` |
| Normal | `<leader>tt` | Neotest: ejecutar test cercano | `.config/nvim/lua/plugins/neotest.lua` |
| Normal | `<leader>tf` | Neotest: ejecutar archivo actual | `.config/nvim/lua/plugins/neotest.lua` |
| Normal | `<leader>to` | Neotest: abrir output | `.config/nvim/lua/plugins/neotest.lua` |
| Normal | `<leader>ts` | Neotest: toggle summary | `.config/nvim/lua/plugins/neotest.lua` |
| Normal | `<leader>tS` | Neotest: detener ejecución | `.config/nvim/lua/plugins/neotest.lua` |

## Notas

- En `init.lua` también tienes:
  - `set <M-h>=\eh`
  - `set <M-l>=\el`
  - `set <M-p>=\\ep`

  Estas líneas ayudan a que Neovim interprete correctamente `Alt` (`Meta`) para `<M-h>` y `<M-l>`.

- Ya no hay conflicto en `<leader>p` con `present.nvim`: presentación quedó en `<M-p>`.

- `markdown-preview.nvim` no define keybind propio en tu config; se usa por comandos:
  - `:MarkdownPreview`
  - `:MarkdownPreviewToggle`
  - `:MarkdownPreviewStop`
