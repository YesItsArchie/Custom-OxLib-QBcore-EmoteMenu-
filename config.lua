Config = {}

-- Key mapping for opening menu
Config.MenuKey = "F5" -- Change to any key you want

-- Emote categories
Config.EmoteCategories = {
    {
        label = "Fun",
        value = "fun",
        elements = {
            {label = "Wave", value = "WORLD_HUMAN_WAVE", icon = "👋"},
            {label = "Lean", value = "WORLD_HUMAN_LEANING", icon = "🧍‍♂️"},
        }
    },
    {
        label = "Dance",
        value = "dance",
        elements = {
            {label = "Party Dance", value = "WORLD_HUMAN_PARTYING", icon = "💃"},
            {label = "Breakdance", value = "WORLD_HUMAN_BUM_BIN", icon = "🕺"},
        }
    },
    {
        label = "Gestures",
        value = "gestures",
        elements = {
            {label = "Sit", value = "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", icon = "🪑"},
            {label = "Thumbs Up", value = "WORLD_HUMAN_CHEERING", icon = "👍"},
        }
    },
}

-- Default favorites (optional)
Config.DefaultFavorites = {}
