return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {
              sort_by = "case_sensitive",
              renderer = {
                group_empty = true,
              },
              actions = {
                open_file = {
                  quit_on_open = true,
                },
              },
            }
        end,
    }
}
