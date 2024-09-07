local wegasSound = audio_stream_load('wegas.mp3')
gGlobalSyncTable.wegasOpacity = 0

function update()
    if gGlobalSyncTable.wegasOpacity > 0 then
        gGlobalSyncTable.wegasOpacity = gGlobalSyncTable.wegasOpacity - 2.5
    end
end

function hud_render()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.wegasOpacity)
    djui_hud_render_texture(wegas, 0, 0, screenW / 128, screenH / 128)
end

function wegas_command()
    gGlobalSyncTable.wegasOpacity = 255
    return true
end

function on_opacity_change()
    if gGlobalSyncTable.wegasOpacity == 255 then
        audio_stream_play(wegasSound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update)
hook_event(HOOK_ON_HUD_RENDER, hud_render)
hook_on_sync_table_change(gGlobalSyncTable, 'wegasOpacity', 'tag', on_opacity_change)
if network_is_server() then
    hook_chat_command("wegas", "susy", wegas_command)
end
