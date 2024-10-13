local COMENOWSound = audio_stream_load('COME_NOW.mp3')
gGlobalSyncTable.COMENOWOpacity = 0

function update()
    if gGlobalSyncTable.COMENOWOpacity > 0 then
        gGlobalSyncTable.COMENOWOpacity = gGlobalSyncTable.COMENOWOpacity - 2.5
    end
end

function hud_render()
    local screenH = djui_hud_get_screen_height()
    local screenW = djui_hud_get_screen_width()
    djui_hud_set_color(255, 255, 255, gGlobalSyncTable.COMENOWOpacity)
    djui_hud_render_texture(COMENOW, 0, 0, screenW / 128, screenH / 128)
end

function COMENOW_command()
    gGlobalSyncTable.COMENOWOpacity = 255
    return true
end

function on_opacity_change()
    if gGlobalSyncTable.COMENOWOpacity == 255 then
        audio_stream_play(COMENOWSound, true, 3)
    end
end

hook_event(HOOK_UPDATE, update)
hook_event(HOOK_ON_HUD_RENDER, hud_render)
hook_on_sync_table_change(gGlobalSyncTable, 'COMENOWOpacity', 'tag', on_opacity_change)
if network_is_server() then
    hook_chat_command("comenow", "TAKE THE STEP", COMENOW_command)
end
