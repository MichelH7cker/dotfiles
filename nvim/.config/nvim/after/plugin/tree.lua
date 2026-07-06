-- Arquivo: lua/plugins/tree.lua

-- Atalho global para abrir e fechar a árvore de arquivos.
-- É uma boa prática manter os atalhos globais perto da configuração do plugin
-- que eles controlam, mas eles podem estar em um arquivo separado.
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", {
  desc = "NeoTree: Toggle file explorer"
})

-- Atalho global para focar e revelar o arquivo atual no Neotree.
-- Este comando funciona quando o seu cursor está em uma janela de código.
vim.keymap.set("n", "<leader>o", ":Neotree focus reveal<CR>", {
  desc = "NeoTree: Open and reveal current file"
})

-- Configuração completa do Neotree
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Ícones (opcional, mas recomendado)
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- Fecha o Neotree se for a última janela visível
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        position = "left",
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        -- AQUI ESTÁ A LÓGICA PRINCIPAL DA SUA SOLICITAÇÃO
        mappings = {
          ["<space>"] = false, -- Desabilita a ação padrão da barra de espaço, se desejar
          ["<CR>"] = "open",
          ["o"] = "open",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["t"] = "open_tabnew",
          ["<C-x>"] = "close_window",
          ["z"] = "close_all_nodes",
          ["a"] = "add",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy", -- Copia o arquivo/pasta
          ["m"] = "move",
          ["q"] = "close_window",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
          
          -- COMPORTAMENTO INTELIGENTE PARA <leader>o:
          -- Quando o cursor estiver na janela do Neotree, este mapeamento
          -- terá prioridade e o levará de volta para a janela anterior (seu código).
          ["<leader>o"] = "wincmd p",

          -- BÔNUS: Use <leader>e para fechar a janela também, tornando-o um toggle perfeito
          ["<leader>e"] = "close_window",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true, -- Mostra arquivos ocultos e ignorados por padrão
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true, -- Segue automaticamente o arquivo que você está editando
        },
        hijack_netrw_behavior = "open_current", -- Abre o Neotree no diretório atual
      },
    })
  end,
}
