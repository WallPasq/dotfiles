-- --- Keymaps Config --

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

-- Delete character without copying to clipboard
keymap.set("n", "x", '"_x')

-- --- Window Management (Splits) ---
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Vertical split" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Horizontal split" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize split sizes" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- --- Tab Management ---
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Previous tab" })

-- --- Save and Exit Quickly ---
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Exit" })
