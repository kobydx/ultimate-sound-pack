-- Alarm7.lua
local alarm7Sound = audio_stream_load('Alarm07.mp3')
gGlobalSyncTable.alarm7Opacity = 0

function update_alarm7()
    if gGlobalSyncTable.alarm7Opacity > 0 then
        gGlobalSyncTable.alarm7Opacity = gGlobalSyncTable.alarm7Opacity - 2.5
    end
end

function hud_render_alarm7()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.alarm7Opacity)
    djui_hud_render_texture(alarm7Texture, 0, 0, screenW / 128, screenH / 128)
end

function alarm7_command()
    gGlobalSyncTable.alarm7Opacity = 255
    return true
end

function on_opacity_change_alarm7()
    if gGlobalSyncTable.alarm7Opacity == 255 then
        audio_stream_play(alarm7Sound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update_alarm7)
hook_event(HOOK_ON_HUD_RENDER, hud_render_alarm7)
hook_on_sync_table_change(gGlobalSyncTable, 'alarm7Opacity', 'tag', on_opacity_change_alarm7)
if network_is_server() then
    hook_chat_command("alarm7", "Trigger Alarm 7", alarm7_command)
end
