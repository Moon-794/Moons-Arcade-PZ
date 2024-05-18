require "ISUI/ISPanel"
require "ISUI/ISButton"

ArcadeWindow = ISPanel:derive("ArcadeWindow")
buton = ISButton:derive("buton")

function buton:new(x, y, width, height, title, clicktarget, onclick, onmousedown, allowMouseUpProcessing)
    local b = ISButton:new(x, y, width, height, title, clicktarget, onclick, onmousedown, allowMouseUpProcessing)
    setmetatable(b, self)
    self.__index = self
    return b
end

function ArcadeWindow:initialise()
    ISPanel.initialise(self)
end

function ArcadeWindow:createChildren()
    ISPanel.createChildren(self)
    but = buton:new(0, 0, 200, 200, "Button", {}, {}, {}, {})
    self:addChild(but)
end

function ArcadeWindow:render()
    ISPanel.render(self)
    self:drawRect(10, 10, 100, 100, 1, 0, 0, 0.5)
end

function ArcadeWindow:new(x, y, width, height)
    local panel = ISPanel:new(x, y, width, height)
    setmetatable(panel, self)
    self.__index = self

    return panel
end

function OpenWindow()
    local arcadeWin = ArcadeWindow:new(100, 100, 200, 200)
    arcadeWin:addToUIManager()
end

function OnKeyPress(key)
    if key == 33 then
        OpenWindow()
    end
end

Events.OnKeyPressed.Add(OnKeyPress)