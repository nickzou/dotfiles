return {
    'mattn/emmet-vim',
    ft = { 'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'blade', 'twig', 'php' },
    init = function()
        vim.g.user_emmet_mode = 'a'
        vim.g.user_emmet_leader_key = '<C-y>'
    end,
}
