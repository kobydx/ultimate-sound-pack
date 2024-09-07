-- Alarm1.lua
local alarm1Sound = audio_stream_load('Alarm01.mp3')
gGlobalSyncTable.alarm1Opacity = 0

function update_alarm1()
    if gGlobalSyncTable.alarm1Opacity > 0 then
        gGlobalSyncTable.alarm1Opacity = gGlobalSyncTable.alarm1Opacity - 2.5
    end
end

function hud_render_alarm1()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.alarm1Opacity)
    djui_hud_render_texture(alarm1Texture, 0, 0, screenW / 128, screenH / 128)
end

function alarm1_command()
    gGlobalSyncTable.alarm1Opacity = 255
    return true
end

function on_opacity_change_alarm1()
    if gGlobalSyncTable.alarm1Opacity == 255 then
        audio_stream_play(alarm1Sound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update_alarm1)
hook_event(HOOK_ON_HUD_RENDER, hud_render_alarm1)
hook_on_sync_table_change(gGlobalSyncTable, 'alarm1Opacity', 'tag', on_opacity_change_alarm1)
if network_is_server() then
    hook_chat_command("alarm1", "Trigger Alarm 1", alarm1_command)
end
