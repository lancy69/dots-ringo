-- Give <Caps> normal key-up/key-down events by mapping it to <F18>.
local _, ok = hs.execute([[
	hidutil property --set '{
		"UserKeyMapping": [
			{
				"HIDKeyboardModifierMappingSrc": 0x700000039,
				"HIDKeyboardModifierMappingDst": 0x70000006d
			}
		]
	}'
]])
if not ok then
	hs.alert.show("Could not map <Caps> to <F18>.")
end

-- Setup for:
--   - <Caps> (<F18>) alone as <Esc>,
--   - <Caps> with key X as <Ctrl> + X,
--   - <Caps> + <;> as <Ctrl> + <a>.

local keys = hs.keycodes.map
local types = hs.eventtap.event.types

local newKeyEvent = hs.eventtap.event.newKeyEvent
local currentTime = function()
	local timestamp = hs.timer.secondsSinceEpoch()
	---@cast timestamp number
	return timestamp
end

---@type boolean
local capsHeld = false
---@type boolean
local capsUsed = false
---@type number
local capsPressedAt = 0
---@type boolean
local semicolonMapped = false

CapsMap = hs.eventtap.new({
	types.keyDown,
	types.keyUp,
	types.flagsChanged,
	types.leftMouseDown,
	types.leftMouseUp,
	types.leftMouseDragged,
	types.rightMouseDown,
	types.rightMouseUp,
	types.rightMouseDragged,
	types.otherMouseDown,
	types.otherMouseUp,
	types.otherMouseDragged,
	types.mouseMoved,
	types.scrollWheel,
}, function(event)
	local keyCode = event:getKeyCode()
	local eventType = event:getType()

	if keyCode == keys.f18
		and (eventType == types.keyDown or eventType == types.keyUp) then

		if eventType == types.keyDown then
			if capsHeld then return true end
			capsHeld = true

			capsPressedAt = currentTime()
			return true, { newKeyEvent(keys.ctrl, true) }
		else
			if not capsHeld then return true end
			capsHeld = false

			local keyEvents = { newKeyEvent(keys.ctrl, false) }
			if not capsUsed and currentTime() - capsPressedAt < 1 then
				local flags = event:getFlags()
				local modifiers = {}

				for _, modifier in ipairs({ "alt", "cmd", "ctrl", "fn", "shift" }) do
					if flags[modifier] then
						table.insert(modifiers, modifier)
					end
				end

				table.insert(keyEvents, newKeyEvent(modifiers, keys.escape, true))
				table.insert(keyEvents, newKeyEvent(modifiers, keys.escape, false))
			end

			capsUsed = false
			return true, keyEvents
		end

		return true
	end

	if capsHeld then
		if eventType == types.keyDown
			or eventType == types.flagsChanged
			or eventType == types.leftMouseDown
			or eventType == types.rightMouseDown
			or eventType == types.otherMouseDown
			or eventType == types.scrollWheel then
			capsUsed = true
		end

		local flags = event:getFlags()
		flags.ctrl = true
		event:setFlags(flags)
	end

	if keyCode == keys[";"]
		and (eventType == types.keyDown or eventType == types.keyUp) then

		if eventType == types.keyDown then
			local isRepeat = event:getProperty(
				hs.eventtap.event.properties.keyboardEventAutorepeat
			) ~= 0

			if not isRepeat then
				semicolonMapped = capsHeld
			end
		end

		if semicolonMapped then
			event:setKeyCode(keys.a)
		end

		if eventType == types.keyUp then
			semicolonMapped = false
		end
	end

	return false
end)
CapsMap:start()

-- Map <Caps> back on shutdown.
hs.shutdownCallback = function()
	hs.execute([[
		hidutil property --set '{ "UserKeyMapping": [] }'
	]])
end
