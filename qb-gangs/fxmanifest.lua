fx_version 'cerulean'
game 'gta5'

version '2.5'

author 'Mojito-Fivem'

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/CircleZone.lua',
	'client/main.lua',
	'client/gui.lua',
	'client/creation.lua',
	'client/territories.lua'
}

server_scripts {
	'server/leaders.lua',
	'server/main.lua',
	'server/territories.lua',
	'server/version.lua'
}

shared_scripts { "shared/*.lua" }

files {
	'*.json',

	'html/img/*.png',
	'html/sounds/*.wav',
	
	'html/index.html',
	'html/js/*.js',
	'html/css/*.css'
} 

ui_page 'html/index.html'
