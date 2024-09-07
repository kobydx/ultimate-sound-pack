local chimesSound = audio_stream_load('chimes.mp3')
gGlobalSyncTable.chimesOpacity = 0

function update()
    if gGlobalSyncTable.chimesOpacity > 0 then
        gGlobalSyncTable.chimesOpacity = gGlobalSyncTable.chimesOpacity - 2.5
    end
end

function hud_render()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.chimesOpacity)
    djui_hud_render_texture(chimes, 0, 0, screenW / 128, screenH / 128)
end

function chimes_command()
    gGlobalSyncTable.chimesOpacity = 255
    return true
end

function on_opacity_change()
    if gGlobalSyncTable.chimesOpacity == 255 then
        audio_stream_play(chimesSound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update)
hook_event(HOOK_ON_HUD_RENDER, hud_render)
hook_on_sync_table_change(gGlobalSyncTable, 'chimesOpacity', 'tag', on_opacity_change)
if network_is_server() then
    hook_chat_command("chimes", "chimes", chimes_command)
end
