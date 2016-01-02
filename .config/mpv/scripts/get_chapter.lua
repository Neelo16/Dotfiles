require 'mp.options'

local opt = {
    duration = 2
}

read_options(opt)

function main()
    chapter = mp.get_property_osd("chapter-metadata/by-key/title")
    mp.osd_message(chapter, opt.duration)
end

mp.add_key_binding("g", mp.get_script_name(), main, {repeatable=true})
