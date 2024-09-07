local bupSound = audio_stream_load('bup.mp3')
gGlobalSyncTable.bupOpacity = 0

function update()
    if gGlobalSyncTable.bupOpacity > 0 then
        gGlobalSyncTable.bupOpacity = gGlobalSyncTable.bupOpacity - 2.5
    end
end

function hud_render()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.bupOpacity)
    djui_hud_render_texture(bup, 0, 0, screenW / 128, screenH / 128)
end

function bup_command()
    gGlobalSyncTable.bupOpacity = 255
    return true
end

function on_opacity_change()
    if gGlobalSyncTable.bupOpacity == 255 then
        audio_stream_play(bupSound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update)
hook_event(HOOK_ON_HUD_RENDER, hud_render)
hook_on_sync_table_change(gGlobalSyncTable, 'bupOpacity', 'tag', on_opacity_change)
if network_is_server() then
    hook_chat_command("bup", "bupbbbbbbbbbbbbb", bup_command)
end
