#!/home/rich/anaconda3/bin/python3

def bla():
    print("loading app")
    d = magic("8934", get_flag())
    print(d)


def get_flag():
    return "k\\PbYUHDAM[[VJlVAMVk[VWQE"


def magic(k, f):
    out = b''
    for i in range(len(f)):
        out += bytes([ord(f[i]) ^ ord(k[i % len(k)])])
    return out

bla()
