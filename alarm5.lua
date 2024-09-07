-- Alarm5.lua
local alarm5Sound = audio_stream_load('Alarm05.mp3')
gGlobalSyncTable.alarm5Opacity = 0

function update_alarm5()
    if gGlobalSyncTable.alarm5Opacity > 0 then
        gGlobalSyncTable.alarm5Opacity = gGlobalSyncTable.alarm5Opacity - 2.5
    end
end

function hud_render_alarm5()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.alarm5Opacity)
    djui_hud_render_texture(alarm5Texture, 0, 0, screenW / 128, screenH / 128)
end

function alarm5_command()
    gGlobalSyncTable.alarm5Opacity = 255
    return true
end

function on_opacity_change_alarm5()
    if gGlobalSyncTable.alarm5Opacity == 255 then
        audio_stream_play(alarm5Sound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update_alarm5)
hook_event(HOOK_ON_HUD_RENDER, hud_render_alarm5)
hook_on_sync_table_change(gGlobalSyncTable, 'alarm5Opacity', 'tag', on_opacity_change_alarm5)
if network_is_server() then
    hook_chat_command("alarm5", "Trigger Alarm 5", alarm5_command)
end
