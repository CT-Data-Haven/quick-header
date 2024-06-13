-- from https://github.com/shafayetShafee/downloadthis/blob/main/_extensions/downloadthis/downloadthis.lua
local function optional(arg, default)
    if arg == nil or arg == '' or arg.length == 0
    then
        return default
    else
        return arg
    end
end

function quickhdr(args, kwargs, meta)
    if args[1] == nil then
            return ''
    end

    local hdr_text = pandoc.utils.stringify(args[1])
    
    local side = kwargs['side']
    -- allowable values of side are left, right, center. otherwise default left
    if side ~= 'right' and side ~= 'center' then
        side = 'left'
    end

    local custom_class = optional(pandoc.utils.stringify(kwargs['class']), '')
    local hdr_class = 'header-' .. side .. ' ' .. custom_class
    local id = 'hdr-div-' .. side
    
    quarto.doc.add_html_dependency({
        name = 'quick-header',
        version = '0.1.0',
        stylesheets = { 'resources/css/quick-header.css' }
    })
    
    local div = pandoc.Div(pandoc.Plain(hdr_text), pandoc.Attr(id, {hdr_class}))
    return div
end

return {
    ['quick-header'] = quickhdr,
    ['hdr-left'] = function(args, kwargs, meta)
        kwargs['side'] = 'left'
        return quickhdr(args, kwargs, meta)
    end,
    ['hdr-right'] = function(args, kwargs, meta)
        kwargs['side'] = 'right'
        return quickhdr(args, kwargs, meta)
    end,
    ['hdr-center'] = function(args, kwargs, meta)
        kwargs['side'] = 'center'
        return quickhdr(args, kwargs, meta)
    end
}
