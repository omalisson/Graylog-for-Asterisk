# Graylog-for-Asterisk
After a lot of sweat in search of ways to use Graylog with Asterisk, I discovered that through the GELF method we can create several custom views through scrpts that can be written in your preferred language.

1. - First you will need to create a script that will be called from the Asterisk dialplan receiving the variables you want to see in the graylog. The script can be written in your preferred language!

2. - To facilitate, create a symbolic link from the location of the script to the system PATH, thus facilitating your dialplan call!
Ex: ln -sf /etc/asterisk/inc_call.sh / usr / bin / inc_call
