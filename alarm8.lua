-- Alarm8.lua
local alarm8Sound = audio_stream_load('Alarm08.mp3')
gGlobalSyncTable.alarm8Opacity = 0

function update_alarm8()
    if gGlobalSyncTable.alarm8Opacity > 0 then
        gGlobalSyncTable.alarm8Opacity = gGlobalSyncTable.alarm8Opacity - 2.5
    end
end

function hud_render_alarm8()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.alarm8Opacity)
    djui_hud_render_texture(alarm8Texture, 0, 0, screenW / 128, screenH / 128)
end

function alarm8_command()
    gGlobalSyncTable.alarm8Opacity = 255
    return true
end

function on_opacity_change_alarm8()
    if gGlobalSyncTable.alarm8Opacity == 255 then
        audio_stream_play(alarm8Sound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update_alarm8)
hook_event(HOOK_ON_HUD_RENDER, hud_render_alarm8)
hook_on_sync_table_change(gGlobalSyncTable, 'alarm8Opacity', 'tag', on_opacity_change_alarm8)
if network_is_server() then
    hook_chat_command("alarm8", "Trigger Alarm 8", alarm8_command)
end
