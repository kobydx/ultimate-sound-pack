local notifySound = audio_stream_load('notify.wav')
gGlobalSyncTable.notifyOpacity = 0

function update()
    if gGlobalSyncTable.notifyOpacity > 0 then
        gGlobalSyncTable.notifyOpacity = gGlobalSyncTable.notifyOpacity - 2.5
    end
end

function hud_render()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.notifyOpacity)
    djui_hud_render_texture(notify, 0, 0, screenW / 128, screenH / 128)
end

function notify_command()
    gGlobalSyncTable.notifyOpacity = 255
    return true
end

function on_opacity_change()
    if gGlobalSyncTable.notifyOpacity == 255 then
        audio_stream_play(notifySound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update)
hook_event(HOOK_ON_HUD_RENDER, hud_render)
hook_on_sync_table_change(gGlobalSyncTable, 'notifyOpacity', 'tag', on_opacity_change)
if network_is_server() then
    hook_chat_command("notify", "notify", notify_command)
end
