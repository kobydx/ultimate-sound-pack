local wegaSound = audio_stream_load('scream.mp3')
gGlobalSyncTable.wegaOpacity = 0

function update()
    if gGlobalSyncTable.wegaOpacity > 0 then
        gGlobalSyncTable.wegaOpacity = gGlobalSyncTable.wegaOpacity - 2.5
    end
end

function hud_render()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.wegaOpacity)
    djui_hud_render_texture(wega, 0, 0, screenW / 128, screenH / 128)
end

function wega_command()
    gGlobalSyncTable.wegaOpacity = 255
    return true
end

function on_opacity_change()
    if gGlobalSyncTable.wegaOpacity == 255 then
        audio_stream_play(wegaSound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update)
hook_event(HOOK_ON_HUD_RENDER, hud_render)
hook_on_sync_table_change(gGlobalSyncTable, 'wegaOpacity', 'tag', on_opacity_change)
if network_is_server() then
    hook_chat_command("kurukuru", "[kuru kuru, kuru kuru, kuru kuru, kuru kuru, kuru kuru kururin, kuru kuru kururin]", wega_command)
end
