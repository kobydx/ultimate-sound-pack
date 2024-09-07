-- Alarm6.lua
local alarm6Sound = audio_stream_load('Alarm06.mp3')
gGlobalSyncTable.alarm6Opacity = 0

function update_alarm6()
    if gGlobalSyncTable.alarm6Opacity > 0 then
        gGlobalSyncTable.alarm6Opacity = gGlobalSyncTable.alarm6Opacity - 2.5
    end
end

function hud_render_alarm6()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.alarm6Opacity)
    djui_hud_render_texture(alarm6Texture, 0, 0, screenW / 128, screenH / 128)
end

function alarm6_command()
    gGlobalSyncTable.alarm6Opacity = 255
    return true
end

function on_opacity_change_alarm6()
    if gGlobalSyncTable.alarm6Opacity == 255 then
        audio_stream_play(alarm6Sound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update_alarm6)
hook_event(HOOK_ON_HUD_RENDER, hud_render_alarm6)
hook_on_sync_table_change(gGlobalSyncTable, 'alarm6Opacity', 'tag', on_opacity_change_alarm6)
if network_is_server() then
    hook_chat_command("alarm6", "Trigger Alarm 6", alarm6_command)
end
