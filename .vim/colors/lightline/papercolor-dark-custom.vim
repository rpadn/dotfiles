" inspired by 'one' lightline colorschme, using papercolor-dark palette
let s:red = '#cc6666'
let s:green = '#7fba39'
let s:blue = '#69bbe4'
let s:yellow = '#ffaf00'
let s:aqua1 = '#00afaf'
let s:aqua2 = '#5e8d87'

let s:black = '#1c1c1c'

let s:grey1 = '#282a2e'
let s:grey2 = '#3a3a3a'
let s:grey3 = '#444444'
let s:grey4 = '#585858'

let s:white1 = '#c5c8c6'
let s:white2 = '#c6c6c6'


let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:grey1, s:green, 'bold' ], [ s:white1, s:grey2 ], [ s:white2, s:grey3 ] ]
let s:p.normal.right = [ [ s:grey1, s:green, 'bold' ], [ s:white1, s:grey2 ], [ s:white2, s:grey3 ] ]
let s:p.normal.middle = [ [ s:white2, s:grey3 ]]
let s:p.inactive.right = [ [ s:white1, s:grey3 ], [ s:white1, s:grey3 ] ]
let s:p.inactive.left = [ [ s:white1, s:grey3 ], [ s:white1, s:grey3 ] ]
let s:p.inactive.middle = [ [ s:white1, s:grey3 ], ]
let s:p.insert.left = [ [ s:grey3, s:blue, 'bold' ], [ s:white1, s:grey2 ], [ s:white2, s:grey3 ] ]
let s:p.insert.right = [ [ s:grey3, s:blue, 'bold' ], [ s:white1, s:grey2 ], [ s:white2, s:grey3 ] ]
let s:p.replace.left = [ [ s:grey3, s:red, 'bold' ], [ s:white1, s:grey2 ], [ s:white2, s:grey3 ] ]
let s:p.replace.right = [ [ s:grey3, s:red, 'bold' ], [ s:white1, s:grey2 ], [ s:white2, s:grey3 ] ]
let s:p.visual.left = [ [ s:grey3, s:aqua2, 'bold' ], [ s:white1, s:grey2 ], [ s:white2, s:grey3 ] ]
let s:p.visual.right = [ [ s:grey3, s:aqua2, 'bold' ], [ s:white1, s:grey2 ], [ s:white2, s:grey3 ] ]
let s:p.tabline.left = [ [ s:white2, s:grey4 ] ]
let s:p.tabline.tabsel = [ [ s:black, s:aqua1 , 'bold' ] ]
let s:p.tabline.middle = [ [ s:grey1, s:grey1 ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:grey1, s:red , 'bold' ] ]
let s:p.normal.warning = [ [ s:grey1, s:yellow , 'bold' ] ]
let s:p.normal.info = [ [ s:grey1, s:blue , 'bold' ] ]


let g:lightline#colorscheme#PaperColor_custom#palette = lightline#colorscheme#fill(s:p)
