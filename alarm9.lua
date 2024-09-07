-- Alarm9.lua
local alarm9Sound = audio_stream_load('Alarm09.mp3')
gGlobalSyncTable.alarm9Opacity = 0

function update_alarm9()
    if gGlobalSyncTable.alarm9Opacity > 0 then
        gGlobalSyncTable.alarm9Opacity = gGlobalSyncTable.alarm9Opacity - 2.5
    end
end

function hud_render_alarm9()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.alarm9Opacity)
    djui_hud_render_texture(alarm9Texture, 0, 0, screenW / 128, screenH / 128)
end

function alarm9_command()
    gGlobalSyncTable.alarm9Opacity = 255
    return true
end

function on_opacity_change_alarm9()
    if gGlobalSyncTable.alarm9Opacity == 255 then
        audio_stream_play(alarm9Sound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update_alarm9)
hook_event(HOOK_ON_HUD_RENDER, hud_render_alarm9)
hook_on_sync_table_change(gGlobalSyncTable, 'alarm9Opacity', 'tag', on_opacity_change_alarm9)
if network_is_server() then
    hook_chat_command("alarm9", "Trigger Alarm 9", alarm9_command)
end
