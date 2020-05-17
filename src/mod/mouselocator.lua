local mod = {}

mod.namespace = 'mouselocator'

local mouseCircle = nil
local mouseCircleTimer = nil

function mod.mouseHighlight()
  -- Delete an existing highlight if it exists
  if mouseCircle then
    mouseCircle:delete()
    if mouseCircleTimer then
      mouseCircleTimer:stop()
    end
  end
  -- Get the current co-ordinates of the mouse pointer
  local mousepoint = hs.mouse.getAbsolutePosition ()
  -- Prepare a big red circle around the mouse pointer
  local diameter = mod.context.config.diameter
  local radius = math.floor(diameter / 2)
  mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-radius, mousepoint.y-radius, diameter, diameter))
  mouseCircle:setStrokeColor(mod.context.config.color)
  mouseCircle:setFill(false)
  mouseCircle:setStrokeWidth(mod.context.config.linewidth)
  mouseCircle:show()

  -- Set a timer to delete the circle after 3 seconds
  mouseCircleTimer = hs.timer.doAfter(2, function() mouseCircle:delete() end)
end

return mod
