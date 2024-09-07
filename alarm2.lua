-- Alarm2.lua
local alarm2Sound = audio_stream_load('Alarm02.mp3')
gGlobalSyncTable.alarm2Opacity = 0

function update_alarm2()
    if gGlobalSyncTable.alarm2Opacity > 0 then
        gGlobalSyncTable.alarm2Opacity = gGlobalSyncTable.alarm2Opacity - 2.5
    end
end

function hud_render_alarm2()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.alarm2Opacity)
    djui_hud_render_texture(alarm2Texture, 0, 0, screenW / 128, screenH / 128)
end

function alarm2_command()
    gGlobalSyncTable.alarm2Opacity = 255
    return true
end

function on_opacity_change_alarm2()
    if gGlobalSyncTable.alarm2Opacity == 255 then
        audio_stream_play(alarm2Sound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update_alarm2)
hook_event(HOOK_ON_HUD_RENDER, hud_render_alarm2)
hook_on_sync_table_change(gGlobalSyncTable, 'alarm2Opacity', 'tag', on_opacity_change_alarm2)
if network_is_server() then
    hook_chat_command("alarm2", "Trigger Alarm 2", alarm2_command)
end
