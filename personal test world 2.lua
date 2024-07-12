while true do

    -- Fluid Stuff
    local fluidStorage = peripheral.wrap("left")
    -- local outputTank = peripheral.wrap("right")

    local fluidList = fluidStorage.tanks() -- Gets table of fluids in storage
    local fluidTblSize = #fluidList -- Size of List

    -- for _, fluid in pairs(fluidList) do
    --     flex:addButton():setFlexBasis(1):setFlexGrow(1):setText(fluid):onClick(function() basalt.debug("Clicked!") end)
    -- end
    ------------------------------------
    -- UI Stuff
    local basalt = require("basalt")

    local main = basalt.createFrame()

    local flexFrame = main:addMovableFrame():setSize(49, 17):setPosition(2, 2):setBackground(colors.gray):setBorder(colors.black)
    local flex = flexFrame:addFlexbox():setWrap("wrap"):setPosition(2, 2):setSize("parent.w - 2", "parent.h - 2"):setBackground(colors.gray):setForeground(colors.black):setTheme({ButtonBG=colors.black, ButtonText=colors.lightGray})

    -- function capture(fluidName)
    --     local dispenseValue = outputAmount:getValue()
    --     local dispenseButton = main:addButton():setText("Dispense Liquid"):setPosition(35, 20)
    --     fluidStorage.pushFluid(peripheral.getName(outputTank), dispenseValue, fluidName)
    -- end

    -- Iterates making buttons for each available liquid

    -- Capitalizes each word
        function capitalizeWords(str)
            return str:gsub("(%w)(%w*)", function(first, rest)
                return first:upper() .. rest:lower()
            end)
        end
    -- Removes underscores
        function replaceUnderscores(str)
            return str:gsub("_", " ")
        end
    local f1 = flex:addFrame():setBackground(colors.black):setSize(49, 3):setOffset(0, -1)
    f1:addLabel():setForeground(colors.lightGray):setTextAlign("center"):setSize("parent.w", "parent.h"):setText("List of stored fluids"):setFontSize(1)
    for _, fluid in pairs(fluidList) do
    -- Removes mod ID and colon, but leaves underscore
    local fluidTemp = string.sub(fluid.name, string.find(fluid.name, ":") + 1, #fluid.name)
    -- local fluidTemp = fluid.name

    -- Name of fluid without underscore
    local fluidTemp2 = replaceUnderscores(fluidTemp)

    -- Capitalize each word
    local fluidName = capitalizeWords(fluidTemp2)
    local f2 = flex:addFrame():setBackground(colors.black):setSize(49, 2):setFlexBasis(2):setFlexGrow(1)
    f2:addLabel()
        :setForeground(colors.lightGray)
        :setTextAlign("center")
        :setSize("parent.w", "parent.h")
        :setText(fluidName)
    end
    basalt.autoUpdate()
end