##Author - Thusara Dimuth

def getIns(input_file):
    with open(input_file,"r")as Input:
        lst1=Input.readlines()
    lst2=[]
    n=len(lst1)
    for i in range(n):
        lst2.append(lst1[i][:-1].split(' '))
    return lst2


def Map(lst):
    lst2=[]
    for i in lst:
        if i[0] == "ST":
            lst2.append("0010000000000000")
        elif i[0] == "LD":
            lst2.append("0011000000000000")
        elif i[0] == "MVAT":
            lst2.append("0100000000000000")
        elif i[0] == "MVT":
            lst2.append("0101000000000000")
        elif i[0] == "MVAR":
            lst2.append("0110000000000000")
        elif i[0] == "MVR":
            lst2.append("0111000000000000")
        elif i[0] == "CLAC":
            lst2.append("1000000000000000")
        elif i[0] == "ADD":
            lst2.append("1001000000000000")
        elif i[0] == "SUB":
            lst2.append("1010000000000000")
        elif i[0] == "MULT":
            lst2.append("1011000000000000")
        elif i[0] == "INC":
            lst2.append("1100000000000000")
        elif i[0] == "END":
            lst2.append("1111000000000000")
        elif i[0] == "STAC":
            lst2.append("0000"+'{0:012b}'.format(int(i[2])))
        elif i[0] == "LDAC":
            lst2.append("0001"+'{0:012b}'.format(int(i[2])))
        elif i[0] == "JPNZ":
            lst2.append("1101"+'{0:012b}'.format(int(i[2])))
        elif i[0] == "JMPZ":
            lst2.append("1110"+'{0:012b}'.format(int(i[2])))
        else:
            lst2.append("#############################")
    return(lst2)

def Output(lst):
    with open("Instructions.txt","w")as Output:
        for element in lst:
            Output.write(element + "\n")

lst = getIns("Assembly_code.txt")
mapped_lst = Map(lst)
Output(mapped_lst)
print(mapped_lst)
