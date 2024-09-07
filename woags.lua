local woagstaffSound = audio_stream_load('woagstaffroll.ogg')
gGlobalSyncTable.woagstaffOpacity = 0

function update()
    if gGlobalSyncTable.woagstaffOpacity > 0 then
        gGlobalSyncTable.woagstaffOpacity = gGlobalSyncTable.woagstaffOpacity - 2.5
    end
end

function hud_render()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.woagstaffOpacity)
    djui_hud_render_texture(woagstaff, 0, 0, screenW / 128, screenH / 128)
end

function woagstaff_command()
    gGlobalSyncTable.woagstaffOpacity = 255
    return true
end

function on_opacity_change()
    if gGlobalSyncTable.woagstaffOpacity == 255 then
        audio_stream_play(woagstaffSound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update)
hook_event(HOOK_ON_HUD_RENDER, hud_render)
hook_on_sync_table_change(gGlobalSyncTable, 'woagstaffOpacity', 'tag', on_opacity_change)
if network_is_server() then
    hook_chat_command("woagstaff", "1", woagstaff_command)
end
