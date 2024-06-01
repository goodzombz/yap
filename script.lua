local result = get("result")
local button = get("button")

button.on_click(function()
    result.set_content("lower")
end)
