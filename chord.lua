local chordSound = audio_stream_load('chord.mp3')
gGlobalSyncTable.chordOpacity = 0

function update()
    if gGlobalSyncTable.chordOpacity > 0 then
        gGlobalSyncTable.chordOpacity = gGlobalSyncTable.chordOpacity - 2.5
    end
end

function hud_render()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.chordOpacity)
    djui_hud_render_texture(chord, 0, 0, screenW / 128, screenH / 128)
end

function chord_command()
    gGlobalSyncTable.chordOpacity = 255
    return true
end

function on_opacity_change()
    if gGlobalSyncTable.chordOpacity == 255 then
        audio_stream_play(chordSound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update)
hook_event(HOOK_ON_HUD_RENDER, hud_render)
hook_on_sync_table_change(gGlobalSyncTable, 'chordOpacity', 'tag', on_opacity_change)
if network_is_server() then
    hook_chat_command("chord", "chord", chord_command)
end
