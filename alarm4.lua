-- Alarm4.lua
local alarm4Sound = audio_stream_load('Alarm04.mp3')
gGlobalSyncTable.alarm4Opacity = 0

function update_alarm4()
    if gGlobalSyncTable.alarm4Opacity > 0 then
        gGlobalSyncTable.alarm4Opacity = gGlobalSyncTable.alarm4Opacity - 2.5
    end
end

function hud_render_alarm4()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.alarm4Opacity)
    djui_hud_render_texture(alarm4Texture, 0, 0, screenW / 128, screenH / 128)
end

function alarm4_command()
    gGlobalSyncTable.alarm4Opacity = 255
    return true
end

function on_opacity_change_alarm4()
    if gGlobalSyncTable.alarm4Opacity == 255 then
        audio_stream_play(alarm4Sound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update_alarm4)
hook_event(HOOK_ON_HUD_RENDER, hud_render_alarm4)
hook_on_sync_table_change(gGlobalSyncTable, 'alarm4Opacity', 'tag', on_opacity_change_alarm4)
if network_is_server() then
    hook_chat_command("alarm4", "Trigger Alarm 4", alarm4_command)
end
