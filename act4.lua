local act4Sound = audio_stream_load('Act4.mp3')
gGlobalSyncTable.act4Opacity = 0

function update()
    if gGlobalSyncTable.act4Opacity > 0 then
        gGlobalSyncTable.act4Opacity = gGlobalSyncTable.act4Opacity - 2.5
    end
end

function hud_render()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.act4Opacity)
    djui_hud_render_texture(act4, 0, 0, screenW / 128, screenH / 128)
end

function act4_command()
    gGlobalSyncTable.act4Opacity = 255
    return true
end

function on_opacity_change()
    if gGlobalSyncTable.act4Opacity == 255 then
        audio_stream_play(act4Sound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update)
hook_event(HOOK_ON_HUD_RENDER, hud_render)
hook_on_sync_table_change(gGlobalSyncTable, 'act4Opacity', 'tag', on_opacity_change)
if network_is_server() then
    hook_chat_command("act4", "m", act4_command)
end
