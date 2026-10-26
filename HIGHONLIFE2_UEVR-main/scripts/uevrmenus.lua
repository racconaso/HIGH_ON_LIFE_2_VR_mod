-- ─────────────────────────────────────────────────────────────────────────────
-- Sidebar panel whitelist — must run BEFORE any init() that creates panels.
-- Only the two user-facing panels are allowed through; all dev/internal panels
-- are silently dropped. Callbacks, data load/save are unaffected.
-- ─────────────────────────────────────────────────────────────────────────────
local _ALLOWED_PANELS = {
    ["Attachments Config"]     = true,
    ["Attachments Config Dev"] = true,
    ["High On Life 2 Config"]  = true,
}
if uevr and uevr.lua and uevr.lua.add_script_panel then
    local _orig_add_panel = uevr.lua.add_script_panel
    uevr.lua.add_script_panel = function(label, drawFn)
        if not _ALLOWED_PANELS[label] then return end
        return _orig_add_panel(label, drawFn)
    end
end

local uevrUtils = require('libs/uevr_utils')
local controllers = require('libs/controllers')
local configui = require("libs/configui")
local reticule = require("libs/reticule")
local hands = require('libs/hands')
local attachments = require('libs/attachments')
local accessories = require('libs/accessories')
local input = require('libs/input')
local pawnModule = require('libs/pawn')
local animation = require('libs/animation')
local montage = require('libs/montage')
local interaction = require('libs/interaction')
local ui = require('libs/ui')
local remap = require('libs/remap')
local gestures = require('libs/gestures')

uevrUtils.setDeveloperMode(true)

ui.init()
montage.init()
interaction.init()
attachments.init()
reticule.init()
pawnModule.init()
remap.init()
input.init()
accessories.init()
require('main')