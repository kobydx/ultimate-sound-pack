local woagSound = audio_stream_load('woag.mp3')
gGlobalSyncTable.woagOpacity = 0

function update()
    if gGlobalSyncTable.woagOpacity > 0 then
        gGlobalSyncTable.woagOpacity = gGlobalSyncTable.woagOpacity - 2.5
    end
end

function hud_render()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.woagOpacity)
    djui_hud_render_texture(woag, 0, 0, screenW / 128, screenH / 128)
end

function woag_command()
    gGlobalSyncTable.woagOpacity = 255
    return true
end

function on_opacity_change()
    if gGlobalSyncTable.woagOpacity == 255 then
        audio_stream_play(woagSound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update)
hook_event(HOOK_ON_HUD_RENDER, hud_render)
hook_on_sync_table_change(gGlobalSyncTable, 'woagOpacity', 'tag', on_opacity_change)
if network_is_server() then
    hook_chat_command("woag", "woaaaaaaaaaaaaaaaaaaaag", woag_command)
end
