# gosource.nvim

jump to file with another extension

### Installation

```lua
-- example with lazy.nvim
{
    'alekseysav/gosource.nvim'
},
```

### Usage

```lua
vim.keymap.set('n', '<leader>gs', require('gosource').change_extension({
	{ '.proto', '.pb.h' },
	{ '.pb.h', '.proto' },
	{ '.h', '.cpp', create = true },
	{ '.cpp', '.h' },
}))

-- change_extension accepts list of entries
-- entry:
--  [#0] = extension of original file
--  [#1] = extension of file to jump to
--  ['create']: true if ok to jump to non-existent file
```
