local QBCore = exports['qb-core']:GetCoreObject()
local ox_lib = exports.ox_lib

local FavoriteEmotes = Config.DefaultFavorites or {}

-- Open main menu
local function OpenCustomMenu()
    local mainMenuElements = {}

    -- Favorites section
    if next(FavoriteEmotes) ~= nil then
        table.insert(mainMenuElements, {label = "★ Favorites →", value = "favorites"})
    end

    -- Other categories
    for _, cat in pairs(Config.EmoteCategories) do
        table.insert(mainMenuElements, {label = cat.label.." →", value = cat.value})
    end

    ox_lib:menu({
        title = "Custom Emote Menu",
        align = "top-left",
        elements = mainMenuElements,
        search = true,
        onSelect = function(menuData)
            if menuData.value == "favorites" then
                OpenFavoritesMenu()
            else
                OpenCategory(menuData.value)
            end
        end
    })
end

-- Open category submenu
function OpenCategory(categoryValue)
    for _, cat in pairs(Config.EmoteCategories) do
        if cat.value == categoryValue then
            ox_lib:menu({
                title = cat.label,
                align = "top-left",
                elements = cat.elements,
                search = true,
                onSelect = function(menuData)
                    local ped = PlayerPedId()
                    TaskStartScenarioInPlace(ped, menuData.value, 0, true)
                    QBCore.Functions.Notify("Emote: "..menuData.label, "success")
                end,
                onContext = function(menuData)
                    -- Right-click to add/remove favorite
                    if FavoriteEmotes[menuData.value] then
                        FavoriteEmotes[menuData.value] = nil
                        QBCore.Functions.Notify(menuData.label.." removed from favorites ⭐", "error")
                    else
                        FavoriteEmotes[menuData.value] = menuData
                        QBCore.Functions.Notify(menuData.label.." added to favorites ⭐", "success")
                    end
                end
            })
            return
        end
    end
    QBCore.Functions.Notify("Category not found", "error")
end

-- Favorites submenu
function OpenFavoritesMenu()
    local favElements = {}
    for _, emote in pairs(FavoriteEmotes) do
        table.insert(favElements, emote)
    end

    ox_lib:menu({
        title = "★ Favorites",
        align = "top-left",
        elements = favElements,
        search = true,
        onSelect = function(menuData)
            local ped = PlayerPedId()
            TaskStartScenarioInPlace(ped, menuData.value, 0, true)
        end,
        onContext = function(menuData)
            FavoriteEmotes[menuData.value] = nil
            QBCore.Functions.Notify(menuData.label.." removed from favorites ⭐", "error")
        end
    })
end

-- Command to open menu
RegisterCommand("emotemenu", function()
    OpenCustomMenu()
end)

-- Hotkey support
CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustReleased(0, Keys[Config.MenuKey]) then
            OpenCustomMenu()
        end
    end
end)

-- Mapping keys to codes
Keys = {
    ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F4"] = 166, ["F5"] = 167,
    ["F6"] = 168, ["F7"] = 169, ["F8"] = 170, ["F9"] = 56, ["F10"] = 57
}
