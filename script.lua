local result = get("result")
local button = get("button")
num = 20
local inp = get("delete-input-key")
button.on_click(function()
    if inp.get_content() > num then result.set_content("lower") end
    if inp.get_content() < num then result.set_content("higher") end
    if inp.get_content() == num then result.set_content("you win!!!") end
end)
