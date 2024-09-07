local w10backgroundSound = audio_stream_load('w10background.mp3')
gGlobalSyncTable.w10backgroundOpacity = 0

function update()
    if gGlobalSyncTable.w10backgroundOpacity > 0 then
        gGlobalSyncTable.w10backgroundOpacity = gGlobalSyncTable.w10backgroundOpacity - 2.5
    end
end

function hud_render()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.w10backgroundOpacity)
    djui_hud_render_texture(w10background, 0, 0, screenW / 128, screenH / 128)
end

function w10background_command()
    gGlobalSyncTable.w10backgroundOpacity = 255
    return true
end

function on_opacity_change()
    if gGlobalSyncTable.w10backgroundOpacity == 255 then
        audio_stream_play(w10backgroundSound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update)
hook_event(HOOK_ON_HUD_RENDER, hud_render)
hook_on_sync_table_change(gGlobalSyncTable, 'w10backgroundOpacity', 'tag', on_opacity_change)
if network_is_server() then
    hook_chat_command("w10background", "w10background", w10background_command)
end