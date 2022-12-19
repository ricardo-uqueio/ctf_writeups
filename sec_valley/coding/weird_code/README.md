**Challenge:** Weird code<br>
**Level 2**<br>
**Score**: 15 <br>
**Category:** Coding<br><br>
**Description**<br>
I've found a weird piece of code in the internet. That looks strange....but there is a flag inside. I belive that! Help me, plz.<br><br>
Link: https://github.com/SecurityValley/PublicCTFChallenges/tree/master/coding/weird_code<br><br>
Following the link we're given a file named 'code.txt'. Analysing the contents of the file, we see the following:<br>
**code.txt**<br>
`code.txt here`<br><br>
This is the python bytecode.
So what is python bytecode?<br>
As [this](https://opensource.com/article/18/4/introduction-python-bytecode) article states:<br>
>Python, like many interpreted languages, actually compiles source code to a set of instructions for a virtual machine, and the Python interpreter is an implementation of that virtual machine. This intermediate format is called "bytecode."<br>
More specifically, it is part of the output one would get when using the python module 'dis'.<br>
We can learn more about what [dis](https://docs.python.org/3/library/dis.html) is and what it does reading the official documentation.<br>
