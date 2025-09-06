fx_version 'cerulean'
game 'gta5'

author 'AL/YesItsArchie'
description 'Custom OXLib Emote Menu for QBCore'
version '1.0.0'

-- QBCore dependency
shared_script '@qb-core/shared/locale.lua'

-- Config
shared_scripts {
    'config.lua'
}

-- Client scripts
client_scripts {
    'client/main.lua'
}

-- Server scripts (if needed for future expansion)
server_scripts {
    'server/main.lua'
}

-- Dependencies
dependencies {
    'qb-core',
    'ox_lib'
}
