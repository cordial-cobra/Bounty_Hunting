# Bounty Hunting
Adds in the ability to set a bounty on a player in a MT server. Once you are on the list, the only way to be taken off is to be killed by another player.

### Author:
#### cordial-cobra (Mr_Pardison)

### Testers: 
Feel free to test this mod once I have made it into a functioning one where it doesn't crash and have made an official post on the MT forum.

### License: LGPLv2.1 (https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html)

## Installation:
download the .zip file and extract it. Place the extracted folder into your mods directory. The enable it, select the world you have and click configure. Once there, click on the mod name in the list and either double click it or click the "enable mod" button at the top of the window.

## Extended Description
This mod allows you to set a bounty on anyone that you want to that is currently in the game (or any player if the name is spelled correctly) and the reward for killing that player can be set at any amount so long as the player has the reward. If another player posts a bounty for the same player, the reward will stack up. There is a command to add a player to the blacklist (for an admin or other trusted player) to add a player to the list as a way of dealing with one that you find annoying (i.e. /bounty add <player_name> <reward> <reason>). The reward for fulfilling the contract can be multiple items and the reason is optional but can be used if desired, to let the player know why they have been added to the list. As an optional dependency, you can run the command from the IRC channel if you have one associated with your server.

### Add-ons for the future
There will eventually be the ability to exclude certain players from the blacklist as defined by a priv. This will also prevent them from adding players to the bounty list as a measure against abusing the system.  Another option that will be added in a future release is when a player has been added to the blacklist, everyone can be told about it.

### What happens when a player gets Blacklisted:
When a player is added to The List, a chat message will be sent to that player saying "You have been added to the blacklist by <player>. The reward for killing you is <item_name>, x<quantity>." For the player who added someone to The List, it will tell them "You have successfully added <player_name> to The List at the price of <quantity_of_item> <item>."

### Support
If you have any questions, find a bug, exploit or have any issues, please put the latter three on the GitHub repository under the "issues" tab. For questions, you can contact me via IRC by querying Mr_Pardison and if it says no such nick/channel, then query Mr-Pardison to contact me. If I am not online, do /msg memoserv send Mr_Pardison <message>.

### Notice:
If you run both this mod and rubenwardy's CTF PvP engine at the same time, the engine will object to the registration of of the bounty_admin priv occuring in both. If you wish to avoid this, don't run both at the same time. I have this notice in order to prevent the conflict of them and cover the possibility of this happening.

## Those who helped along the way:
[rubenwardy](https://github.com/rubenwardy/), [Ezhh](https://github.com/Ezhh/), and [tenplus](https://github.com/tenplus1/) for their support and encouragment.
[AlexINF](https://github.com/alexdevteam/) for their help in debuggign the code.
[ANAND](https://github.com/ClobberXD/) for their help with the backend of the mod. Very much appreciated for this.
If I missed anyone, please let me know as those who helped along the way deserve to be given credit.

### Thanks and Happy hunting! 
