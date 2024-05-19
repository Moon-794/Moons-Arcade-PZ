require "ISUI/ISPanel"
require "ISUI/ISButton"

ArcadeWindow = ISCollapsableWindow:derive("ArcadeWindow")

function TestFunc(window)
    window:close()
end

function ArcadeWindow:initialise()
    ISPanel.initialise(self)

    self.closebutton = ISButton:new(0, 170, 200, 30, "Close", self, function()
        TestFunc(self)
    end)
    self.closebutton:initialise()
    self.closebutton:instantiate()
    self:addChild(self.closebutton)
end

function ArcadeWindow:render()
    ISPanel.render(self)
    self:drawRect(10, 10, 100, 100, 1, 0, 0, 0.5)
end

function ArcadeWindow:new(x, y, width, height)
    local panel = ISCollapsableWindow:new(x, y, width, height)
    setmetatable(panel, self)
    self.__index = self

    panel:initialise()
    return panel
end

function OpenWindow()
    local arcadeWin = ArcadeWindow:new(1500, 600, 200, 200)
    arcadeWin:addToUIManager()
end

function OnKeyPress(key)
    if key == 33 then
        OpenWindow()
    end
end

Events.OnKeyPressed.Add(OnKeyPress)