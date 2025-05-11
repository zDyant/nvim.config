return {
  {
    'danilamihailov/beacon.nvim', -- lazy calls setup() by itself
    config = function()
      require('beacon').setup({
        min_jump = 2,
        speed = 1,
      })
    end
  }
}
