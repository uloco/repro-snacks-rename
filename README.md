### Did you check docs and existing issues?

See issue: https://github.com/folke/snacks.nvim/issues/2709

# Description

I cannot find a way to make Snacks.rename.on_rename_file work with any file explorer I have installed. I have tried several configurations from your docs but none of those work. I settled on https://github.com/antosha417/nvim-lsp-file-operations for now which works with the same setup, so I don't think it is an issue with my lsp server setup. I tried both ts_ls and vtsls. I really would prefer using Snacks since the other plugin only works with nvim-tree and neo-tree.

### Steps To Reproduce

- `nvim -u repro.lua`
- wait until everything is installed
- `:NvimTreeOpen`
- select exportingFile.ts
- rename file with `r`
- open `importingFile.ts`
- import path is wrong and was not updated

### Expected Behavior

When configured, renaming a file in nvim-tree / neo-tree / mini-files should rename all imports of the said file (regardless if the file is open in a buffer or not)
