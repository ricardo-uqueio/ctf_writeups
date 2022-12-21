Writeups for bandit challenges

I've already solved all the bandit challenges before. The goal of these is to practice writeups, so that later I can recall my thought process. Plus, I saw John Hammond solving these with python, so I can use that aproach to practice my scripting skills

Bandit 0:
#ssh to host bandit.labs.overthewire.org with user bandit0 at port 2220
ssh bandit0@bandit.labs.overthewire.org -p 2220
password: bandit0
#####################################
BANDIT 0-1
#####################################
#ssh to host bandit.labs.overthewire.org with user bandit1  at port 2220
ssh bandit0@bandit.labs.overthewire.org -p 2220

# Description:

The password for the next level is stored in a file called readme located in the home directory. Use this password to log into bandit1 using SSH. Whenever you find a password for a level, use SSH (on port 2220) to log into that level and continue the game.

# Solution
after logging in, `cat readme`
**Level 1 password:** NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL


#####################################
BANDIT 1-2
#####################################
#ssh to host bandit.labs.overthewire.org with user bandit2  at port 2220
ssh bandit1@bandit.labs.overthewire.org -p 2220

# Description:

The password for the next level is stored in a file called - located in the home directory

# Solution
`cat ./-`
**Level 2 password:** rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi


#####################################
BANDIT 2-3
#####################################
ssh bandit2@bandit.labs.overthewire.org -p 2220

# Description:

The password for the next level is stored in a file called spaces in this filename located in the home directory

# Solution
`cat spaces\ in\ this\ filename`
**Level 3 pass:** aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG


#####################################
BANDIT 3-4
#####################################
ssh bandit3@bandit.labs.overthewire.org -p 2220

# Description:
The password for the next level is stored in a hidden file in the inhere directory.

# Solution
`cat inhere/.hidden`
**Level 4 pass:** 2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe


#####################################
BANDIT 4-5
#####################################
ssh bandit4@bandit.labs.overthewire.org -p 2220

# Description:
The password for the next level is stored in the only human-readable file in the inhere directory. Tip: if your terminal is messed up, try the “reset” command.

# Solution
execute file command on each file found with find
`find . | file -f - `
`cat ./-file07 #print pass`
**level 5 pass:** lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR

#####################################
BANDIT 5-6
#####################################
ssh bandit5@bandit.labs.overthewire.org -p 2220

# Description:
The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:

    human-readable
    1033 bytes in size
    not executable


# Solution
`find . -size 1033c| file -f -`
`cat ./inhere/maybehere07/.file2`
**Level 6 pass:** P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU


#####################################
BANDIT 6-7
#####################################
ssh bandit6@bandit.labs.overthewire.org -p 2220

# Description:
The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:

    owned by user bandit7
    owned by group bandit6
    33 bytes in size


# Solution
`find / -size 33c -user bandit7 -group bandit6 | file -f - | grep -v "Permission denied"`
`cat /var/lib/dpkg/info/bandit7.password`

**Level 7 pass:** z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S


#####################################
BANDIT 7-8 
#####################################
ssh bandit7@bandit.labs.overthewire.org -p 2220

# Description:
The password for the next level is stored in the file data.txt next to the word millionth
# Solution
`cat data.txt | grep -w "millionth"`
#level 8 pass: TESKZC0XvTetK0S9xNwm25STk5iWrBvP


#####################################
BANDIT 8-9 
#####################################
ssh bandit8@bandit.labs.overthewire.org -p 2220

# Description:
The password for the next level is stored in the file data.txt and is the only line of text that occurs only once
# Solution
`sort data.txt | uniq -u `

**level 9 pass:** EN632PlfYiZbn3PhVK3XOGSlNInNE00t


#####################################
BANDIT 9-10 
#####################################
ssh bandit9@bandit.labs.overthewire.org -p 2220

# Description:
The password for the next level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.

# Solution
`strings data.txt | grep "===="`
**level 10 pass:** G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s

 
#####################################
BANDIT 10-11
#####################################

ssh bandit10@bandit.labs.overthewire.org -p 2220

# Description:
The password for the next level is stored in the file data.txt, which contains base64 encoded data
# Solution
`cat data.txt | base64 -d`
**Level 11 pass:** 6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM


#####################################
BANDIT 11-12
#####################################
ssh bandit11@bandit.labs.overthewire.org -p 2220

# Description:
The password for the next level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions
# Solution
`tr n-za-mN-ZA-M a-zA-Z < data.txt`
**Level 12 pass:** JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv


#####################################
BANDIT 12-13
#####################################
ssh bandit12@bandit.labs.overthewire.org -p 2220

# Description:
The password for the next level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work using mkdir. For example: mkdir /tmp/myname123. Then copy the datafile using cp, and rename it using mv (read the manpages!)

# Solution

First, we make a temp folder and copy the data.txt file to out new temp folder. I like using mktemp -t instead. After that we changne to our temp folder:
```
mktemp -d
cp data.txt /tmp/tmp.G3HoQxcjLc 
cd /tmp/tmp.G3HoQxcjLc
```

When I use 
`file data`
![print 1](bandit12_13_captures/1.png)
It's recognized as a normal text file, but when you print it's contents we can see that the data is not in 'readable' text. 
![print 2](bandit12_13_captures/2.png)

The information provided tells us that the file is in fact the hexdump of a another file which was compressed multiple times.
So first, we need to return the hexdumped data to it's original format.

xxd is a tool that allows us to make a hexdump or do the reverse.. We can use xxd to reverse the hexdump to it's original format, and store the result in a file I'll name "data", with:
xxd -r data.txt > data

With command $file data
![print 3](bandit12_13_captures/3.png)
we can see that the file is in fact gzip compressed data. We can use gunzip or gzip -d to decompress the file, but they only allow gzip extensions.
So first we rename the file and then we decompress it:
![print 4](bandit12_13_captures/4.png)

Checking the decompressed file type, it shows that it is a bzip2 compressed file:
file data
![print 5](bandit12_13_captures/5.png)

Decompressing and seeing what type of file it is:
![print 6](bandit12_13_captures/6.png)

Again we get a bzip file. The process is the same as before:
![print 7](bandit12_13_captures/7.png)

This time the resulting file data5 compressed with tar. Decompressing it we get data5.bin:
![print 8](bandit12_13_captures/8.png)

So we repeat the process:
![print 9](bandit12_13_captures/9.png)

The reslting file data6.bin is compressed using bzip2. We decompress it the same way as before:
![print 10](bandit12_13_captures/10.png)

The resulting file data6.bin.out is yet another tar archive:
![print 11](bandit12_13_captures/11.png)

Now the resulting file data8.bin is compressed with gzip. Again, rename it and decompress:
![print 12a](bandit12_13_captures/12.png)
![print 12b](bandit12_13_captures/12_1.png)
Finally, the resulting file data8 is an ASCII file:
![print 13](bandit12_13_captures/13.png)

With cat data8, we finally have have the password:
![print 14](bandit12_13_captures/14.png)

**Level 13 pass:** wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw


#####################################
BANDIT 13-14
#####################################

ssh bandit13@bandit.labs.overthewire.org -p 2220

# Description
The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. Note: localhost is a hostname that refers to the machine you are working on

# Solution

We can use ssh with the -i flag to specify the identity file (private SSH key) and connect to user **bandit14** and host **localhost**.
`ssh -i sshkey.private bandit14@localhost -p 2220`
After connecting to user **bandit14**, we can view the password for the next level.
`cat /etc/bandit_pass/bandit14`

**Level 14 pass:** fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq


#####################################
BANDIT 14-15
#####################################
ssh bandit14@bandit.labs.overthewire.org -p 2220

# Description
The password for the next level can be retrieved by submitting the password of the current level to port 30000 on localhost.

# Solution
Here I use `nc` to estabilish a connection to localhost with the specified port.
We can use cat to print the contents of the password file `/etc/bandit_pass/bandit14` and pipe it to `nc`.
`cat /etc/bandit_pass/bandit14 | nc localhost 30000`
![output](bandit14_15_captures/1.png)

**Level 15 pass:** jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt


#####################################
BANDIT 15-16
#####################################
ssh bandit15@bandit.labs.overthewire.org -p 2220

# Description
The password for the next level can be retrieved by submitting the password of the current level to port 30001 on localhost using SSL encryption.

Helpful note: Getting “HEARTBEATING” and “Read R BLOCK”? Use -ign_eof and read the “CONNECTED COMMANDS” section in the manpage. Next to ‘R’ and ‘Q’, the ‘B’ command also works in this version of that command…

# Solution
We can use the `openssl s_client [options] host:port` command to estabilish a connection to a server using SSL encryption.  
`echo "jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt" | openssl s_client -connect localhost:30001 -ign_eof 
`
The `-ign_eof` options keeps the connection open to read the response.
![output](bandit15_16_captures/1.png)

** Level 16 pass:** JQttfApK4SeyHwDlI9SXGR50qclOAil1


#####################################
BANDIT 15-16
#####################################
ssh bandit15@bandit.labs.overthewire.org -p 2220

# Description
The credentials for the next level can be retrieved by submitting the password of the current level to a port on localhost in the range 31000 to 32000. First find out which of these ports have a server listening on them. Then find out which of those speak SSL and which don’t. There is only 1 server that will give the next credentials, the others will simply send back to you whatever you send to it.

# Solution
I started by creating a temp directory `/tmp/my_temp_dir` to work with
Then I ran `nmap` to find out which ports are open and which of those ones speak SSL.
'nmap localhost -p31000-32000 --script ssl-cert'.
![nmap](bandit16_17_captures/1.png)
Here we specify `localhost` as the target host since we want to scan our own ports.
With `-p31000-32000` we are specifying the range of ports to be scanned (31000-32000).
`--script ssl-cert` runs a script that detects which of the ports support SSL.


From the output, we can verify that of the 5 open ports, only two support SSL. `31518 and 31790.` 

Just like in the last challenge, we can use echo and pipe the output with `openssl s_client [options] host:port` to send data to the server. But since here we have 2 ports, I created a small bash script that automates the process of sending data to both ports (Also, at first I tought I migh have to run openssl on all 5 ports).
`send_data.sh`

```
#!/usr/bin/bash
ports=(31518 31790)

for port in ${ports[@]}; do
  echo "Running in port $port"
  cat /etc/bandit_pass/bandit16 | timeout 1 openssl s_client -connect localhost:$port -ign_eof -quiet'
done

```
**What the code does:**
First, `cat /etc/bandit_pass/bandit16` prints the contents of the current level.

Next, the command `timeout 1 <command>` is used to force a 1 second timeout to the command `openssl s_client` command. Simply running the `openssl s_client` command causes the shell to hang without being able to move to the next iteration. Either that or openssl has a builtin timeout that takes too long for what I need, so the `timeout` command is still welcome.
`openssl s_client -connect localhost:$port -ign_eof -quiet` command works just like in the previous level but with a few changes:
`-quiet` forces the output to be less verbose.

Running the file I get:
![send_data](bandit16_17_captures/2.png)
This time instead of the password, we get the rsa private key.  
Using `./send_data.sh > response.txt` I run the file and place the response we get from the server in the file `response.txt`.  

After correctly formating the key, I first run `chmod 700 response.txt ` to change the file permissions as otherwise ssh complains about file permissions. 
![permissions](bandit16_17_captures/3.png)

Now I run `ssh -i response.txt bandit17@localhost -p 2220` as user `bandit16` to connect to the server `localhost` as user `bandit17`.
![ssh](bandit16_17_captures/4.png)
Using `cat /etc/bandit_pass/bandit17` we get the password for the next level.

**Level 17 pass:** VwOSWtCA7lRKkTfbr2IDh6awj9RNZM5e