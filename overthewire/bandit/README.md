Writeups for bandit challenges
<<<<<<< HEAD
I've already solved all the bandit challenges before. The goal of these is to practice writeups, so that later I can recall my thought process. Plus, I saw John Hammond solving these with python, so I can use that aproach to practice my scripting skills

Bandit 0:
#ssh to host bandit.labs.overthewire.org with user bandit0 at port 2220
ssh bandit0@bandit.labs.overthewire.org -p 2220
password: bandit0
#####################################
#####################################
	BANDIT 0-1
#####################################
#####################################
#ssh to host bandit.labs.overthewire.org with user bandit1  at port 2220
ssh bandit0@bandit.labs.overthewire.org -p 2220

#description:
The password for the next level is stored in a file called readme located in the home directory. Use this password to log into bandit1 using SSH. Whenever you find a password for a level, use SSH (on port 2220) to log into that level and continue the game.

#solution
after logging in, cat readme
#Level 1 password: NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL

#####################################
#####################################
	BANDIT 1-2
#####################################
#####################################
#ssh to host bandit.labs.overthewire.org with user bandit2  at port 2220
ssh bandit1@bandit.labs.overthewire.org -p 2220

#description
The password for the next level is stored in a file called - located in the home directory

#solution
$ cat ./-
#Level 2 password: rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi

#####################################
#####################################
	BANDIT 2-3
#####################################
#####################################
ssh bandit2@bandit.labs.overthewire.org -p 2220

#description
The password for the next level is stored in a file called spaces in this filename located in the home directory

#solution
cat spaces\ in\ this\ filename
#Level 3 pass: aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG

#####################################
#####################################
	BANDIT 3-4
#####################################
#####################################
ssh bandit3@bandit.labs.overthewire.org -p 2220

#description
The password for the next level is stored in a hidden file in the inhere directory.

#solution
cat inhere/.hidden
#Level 4 pass: 2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe

#####################################
#####################################
	BANDIT 4-5
#####################################
#####################################
ssh bandit4@bandit.labs.overthewire.org -p 2220

#description
The password for the next level is stored in the only human-readable file in the inhere directory. Tip: if your terminal is messed up, try the “reset” command.

#solution
find . | file -f - # execute file command on each file found with find 
cat ./-file07 #print pass
#level 5 pass: lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR

#####################################
#####################################
	BANDIT 5-6
#####################################
#####################################
ssh bandit5@bandit.labs.overthewire.org -p 2220

#description
The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:

    human-readable
    1033 bytes in size
    not executable


#solution
find . -size 1033c| file -f -
cat ./inhere/maybehere07/.file2
#level 6 pass: P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU


#####################################
#####################################
	BANDIT 6-7
#####################################
#####################################
ssh bandit6@bandit.labs.overthewire.org -p 2220

#description
The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:

    owned by user bandit7
    owned by group bandit6
    33 bytes in size


#solution
$ find / -size 33c -user bandit7 -group bandit6 | file -f - | grep -v "Permission denied"
$ cat /var/lib/dpkg/info/bandit7.password

#level 7 pass: z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S


#####################################
#####################################
	BANDIT 7-8 
#####################################
#####################################
ssh bandit7@bandit.labs.overthewire.org -p 2220

#description
The password for the next level is stored in the file data.txt next to the word millionth
#solution
cat data.txt | grep -w "millionth"
#level 8 pass: TESKZC0XvTetK0S9xNwm25STk5iWrBvP


#####################################
#####################################
	BANDIT 8-9 
#####################################
#####################################
ssh bandit8@bandit.labs.overthewire.org -p 2220

#description
The password for the next level is stored in the file data.txt and is the only line of text that occurs only once
#solution
sort data.txt | uniq -u 

#level 9 pass: EN632PlfYiZbn3PhVK3XOGSlNInNE00t


#####################################
#####################################
	BANDIT 9-10 
#####################################
#####################################
ssh bandit9@bandit.labs.overthewire.org -p 2220

#description
The password for the next level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.

#solution
strings data.txt | grep "===="

#level 10 pass: G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s

 
#####################################
#####################################
	BANDIT 10-11
#####################################
#####################################
ssh bandit10@bandit.labs.overthewire.org -p 2220

#description
The password for the next level is stored in the file data.txt, which contains base64 encoded data
#solution
cat data.txt | base64 -d
#level 11 pass: 6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM


#####################################
#####################################
	BANDIT 11-12
#####################################
#####################################
ssh bandit11@bandit.labs.overthewire.org -p 2220

#description
The password for the next level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions
#solution
tr n-za-mN-ZA-M a-zA-Z < data.txt

#level 12 pass: JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv


#####################################
#####################################
	BANDIT 12-13
#####################################
#####################################
ssh bandit12@bandit.labs.overthewire.org -p 2220

#description
The password for the next level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work using mkdir. For example: mkdir /tmp/myname123. Then copy the datafile using cp, and rename it using mv (read the manpages!)

#solution

First, we make a temp folder and copy the data.txt file to out new temp folder. I like using mktemp -t instead. After that we changne to our temp folder:
mktemp -d
cp data.txt /tmp/tmp.G3HoQxcjLc 
cd /tmp/tmp.G3HoQxcjLc

When I use 
file data
[image 1]
It's recognized as a normal text file, but when you print it's contents we can see that the data is not in 'readable' text. 
[image 2]

The information provided tells us that the file is in fact the hexdump of a another file which was compressed multiple times.
So first, we need to return the hexdumped data to it's original format.

xxd is a tool that allows us to make a hexdump or do the reverse.. We can use xxd to reverse the hexdump to it's original format, and store the result in a file I'll name "data", with:
xxd -r data.txt > data

With command $file data
[image 3] 
we can see that the file is in fact gzip compressed data. We can use gunzip or gzip -d to decompress the file, but they only allow gzip extensions.
So first we rename the file and then we decompress it:
[image 4]

Checking the decompressed file type, it shows that it is a bzip2 compressed file:
file data
[image 5]

Decompressing and seeing what type of file it is:
[image 6]

Again we get a bzip file. The process is the same as before:
[7]

This time the resulting file data5 compressed with tar. Decompressing it we get data5.bin:
[8]

So we repeat the process:
[9]

The reslting file data6.bin is compressed using bzip2. We decompress it the same way as before:
[10]

The resulting file data6.bin.out is yet another tar archive:
[11]

Now the resulting file data8.bin is compressed with gzip. Again, rename it and decompress:
[12]
[12_1]

Finally, the resulting file data8 is an ASCII file:
[13]

With cat data8, we finally have have the password:
[14]


#level 13 pass: wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw


=======

I've already solved all the bandit challenges before. The goal here is to practice writing writeups (...is that even a sentence?), so that later I can recall my thought process. Plus, I saw John Hammond solving these with python, I can use that aproach to practice my scripting skills with python.
>>>>>>> ce8b4fee8dea718e62ed3c642623873e2128ba38
