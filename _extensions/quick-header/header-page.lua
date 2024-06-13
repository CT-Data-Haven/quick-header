function Meta(m)
    local is_only_chapter = m['chapter-header-only']
    if is_only_chapter == nil then
        is_only_chapter = false
    end
    local id
    if is_only_chapter then
        id = '@page chapter'
    else
        id = '@page'
    end

    local page_style = [[
        {
            @top-left {
                content: element(hdrDivLeft);
                vertical-align: middle;
            }

            @top-center {
                content: element(hdrDivCenter);
                vertical-align: middle;
            }

            @top-right {
                content: element(hdrDivRight);
                vertical-align: middle;
            }
        }
    ]]
    local page_rule = id .. ' ' .. page_style
    local page_block = pandoc.RawBlock('html', '<style>' .. page_rule .. '</style>')
    table.insert(m['header-includes'], page_block)
    return m
end