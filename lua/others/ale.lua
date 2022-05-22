vim.cmd [[
    let g:ale_fix_on_save = 1
    let g:ale_sign_error = ''
    let g:ale_sign_warning = ''
    let g:ale_linters = { 'c++': ['clang'], 'c': ['clang'], 'python': ['pylint']}
    let g:ale_cpp_cc_options = '-std=c++17 -Wall -Wextra'
]]
