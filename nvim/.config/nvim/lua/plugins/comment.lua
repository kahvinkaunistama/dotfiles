return {
  'numToStr/Comment.nvim',
  opts = {},
  config = function()
    require('Comment').setup({
      padding = true,
      sticky = true,
      ignore = nil,
      toggler = {
        ---Line-comment toggle keymap
        line = 'cc',
        ---Block-comment toggle keymap
        block = 'bc',
      },
        opleader = {
        ---Line-comment keymap
        line = 'ccc',
        ---Block-comment keymap
        block = 'bcc',
      },
      mappings = {
        basic = true,
        extra = true,
      },
      pre_hook = nil,
      post_hook = nil,
    })
  end
}
