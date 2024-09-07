-- Alarm10.lua
local alarm10Sound = audio_stream_load('Alarm10.mp3')
gGlobalSyncTable.alarm10Opacity = 0

function update_alarm10()
    if gGlobalSyncTable.alarm10Opacity > 0 then
        gGlobalSyncTable.alarm10Opacity = gGlobalSyncTable.alarm10Opacity - 2.5
    end
end

function hud_render_alarm10()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.alarm10Opacity)
    djui_hud_render_texture(alarm10Texture, 0, 0, screenW / 128, screenH / 128)
end

function alarm10_command()
    gGlobalSyncTable.alarm10Opacity = 255
    return true
end

function on_opacity_change_alarm10()
    if gGlobalSyncTable.alarm10Opacity == 255 then
        audio_stream_play(alarm10Sound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update_alarm10)
hook_event(HOOK_ON_HUD_RENDER, hud_render_alarm10)
hook_on_sync_table_change(gGlobalSyncTable, 'alarm10Opacity', 'tag', on_opacity_change_alarm10)
if network_is_server() then
    hook_chat_command("alarm10", "Trigger Alarm 10", alarm10_command)
end
