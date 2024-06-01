local result = get("result")
local text = get("text")
local button = get("done-3")
local num = 20

button.on-click(function()
  if text.get_content() > num then
      result.set_content("lower")
  end
  if text.get_content() < num then
      result.set_content("higher")
  end
end)
