local wstartupSound = audio_stream_load('wstartup.wav')
gGlobalSyncTable.wstartupOpacity = 0

function update()
    if gGlobalSyncTable.wstartupOpacity > 0 then
        gGlobalSyncTable.wstartupOpacity = gGlobalSyncTable.wstartupOpacity - 2.5
    end
end

function hud_render()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.wstartupOpacity)
    djui_hud_render_texture(wstartup, 0, 0, screenW / 128, screenH / 128)
end

function wstartup_command()
    gGlobalSyncTable.wstartupOpacity = 255
    return true
end

function on_opacity_change()
    if gGlobalSyncTable.wstartupOpacity == 255 then
        audio_stream_play(wstartupSound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update)
hook_event(HOOK_ON_HUD_RENDER, hud_render)
hook_on_sync_table_change(gGlobalSyncTable, 'wstartupOpacity', 'tag', on_opacity_change)
if network_is_server() then
    hook_chat_command("wstartup", "wstartup", wstartup_command)
end
