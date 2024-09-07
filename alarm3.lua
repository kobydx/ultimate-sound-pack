-- Alarm3.lua
local alarm3Sound = audio_stream_load('Alarm03.mp3')
gGlobalSyncTable.alarm3Opacity = 0

function update_alarm3()
    if gGlobalSyncTable.alarm3Opacity > 0 then
        gGlobalSyncTable.alarm3Opacity = gGlobalSyncTable.alarm3Opacity - 2.5
    end
end

function hud_render_alarm3()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.alarm3Opacity)
    djui_hud_render_texture(alarm3Texture, 0, 0, screenW / 128, screenH / 128)
end

function alarm3_command()
    gGlobalSyncTable.alarm3Opacity = 255
    return true
end

function on_opacity_change_alarm3()
    if gGlobalSyncTable.alarm3Opacity == 255 then
        audio_stream_play(alarm3Sound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update_alarm3)
hook_event(HOOK_ON_HUD_RENDER, hud_render_alarm3)
hook_on_sync_table_change(gGlobalSyncTable, 'alarm3Opacity', 'tag', on_opacity_change_alarm3)
if network_is_server() then
    hook_chat_command("alarm3", "Trigger Alarm 3", alarm3_command)
end
