local ultraMSound = audio_stream_load('ultram.mp3')
gGlobalSyncTable.ultraMOpacity = 0

function update()
    if gGlobalSyncTable.ultraMOpacity > 0 then
        gGlobalSyncTable.ultraMOpacity = gGlobalSyncTable.ultraMOpacity - 2.5
    end
end

function hud_render()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.ultraMOpacity)
    djui_hud_render_texture(ultraM, 0, 0, screenW / 128, screenH / 128)
end

function ultraM_command()
    gGlobalSyncTable.ultraMOpacity = 255
    return true
end

function on_opacity_change()
    if gGlobalSyncTable.ultraMOpacity == 255 then
        audio_stream_play(ultraMSound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update)
hook_event(HOOK_ON_HUD_RENDER, hud_render)
hook_on_sync_table_change(gGlobalSyncTable, 'ultraMOpacity', 'tag', on_opacity_change)
if network_is_server() then
    hook_chat_command("UltraM", "m", ultraM_command)
end
