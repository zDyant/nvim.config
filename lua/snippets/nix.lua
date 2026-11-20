local ls = require 'luasnip'
local snippet = ls.snippet
local insert = ls.insert_node
local text = ls.text_node

return {
  snippet({ trig = 'fn', name = 'Single-argument function' }, {
    insert(1, 'functionName'),
    text ' = ',
    insert(2, 'argument'),
    text ': ',
    insert(0, 'body'),
    text ';',
  }),
  snippet({ trig = 'fnm', name = 'Multiple-argument function' }, {
    insert(1, 'functionName'),
    text ' = ',
    text '{ ',
    insert(2, 'argument1'),
    text ', ',
    insert(3, 'argument2'),
    text { ' }:', '  ' },
    insert(0, 'body'),
    text ';',
  }),
}
