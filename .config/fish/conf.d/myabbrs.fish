abbr -a -- dotfiles 'git --git-dir=/home/gautham/.dotfiles/ --work-tree=/home/gautham'

abbr -a -- iisc_vpn 'sudo openconnect https://vpn.iisc.ac.in'

abbr -a -- mntecis 'mkdir -p ~/ecis_server && sshfs -o idmap=user ecis-server:/home/gautham ~/ecis_server'

abbr -a -- umntecis 'fusermount3 -u ~/ecis_server && rmdir ~/ecis_server'

abbr -a -- mntfpganes 'mkdir -p ~/fpganes && sshfs -o idmap=user ecis-lab:/srv/fpganes ~/fpganes'

abbr -a -- umntfpganes 'fusermount3 -u ~/fpganes && rmdir ~/fpganes'

