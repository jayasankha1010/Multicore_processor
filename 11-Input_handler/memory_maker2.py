##Author - Thusara Dimuth

def getIns(input_file):
    with open(input_file,"r")as Input:
        lst1=Input.readlines()
    lst2=[]
    n=len(lst1)
    for i in range(128):
        if i<n:
            lst2.append(lst1[i][:-1])
        else:
            lst2.append("0000000000000000")
    return lst2

def getMat(input_file):
    with open(input_file,"r")as Input:
        lst1=Input.readlines()
    lst2=[]
    n=len(lst1)
    for i in range(n):
        lst2.append(lst1[i][:-1].split(" "))
    rows = n
    columns = len(lst2[0])
    
    return (lst2,rows,columns)

def getOutput(A,B,m,q,n):
    C=[]
    for i in range(m):
        C.append([])
        for j in range(n):
            C[i].append(0)
            for k in range(q):
                C[i][-1]+=(int(A[i][k])*int(B[k][j]))

    lst = []
    for i in range(m):
        rows = ""
        for j in range(n):
            rows += str(C[i][j])+" "
        print(rows)
        lst.append(rows)
    return(lst)

def writeOutput(lst,k,m,q,n,A,B):        
    # adding A
    for i in range(m):
        for j in range(q):
            lst.append('{0:016b}'.format(int(A[i][j])))
    for i in range(1024):        
            if i>=(m*q):
                lst.append("0000000000000000")
    # adding B
    for i in range(q):
        for j in range(n):
            lst.append('{0:016b}'.format(int(B[i][j])))
    for i in range(1024):        
            if i>=(n*q):
                lst.append("0000000000000000")
    # adding C
    for i in range(1024): 
        lst.append("0000000000000000")

    # adding q, n and base B to the lst
    base_B = 1152
    lst.append('{0:016b}'.format(q))
    lst.append('{0:016b}'.format(n))
    lst.append('{0:016b}'.format(base_B))

    # defining 3203 to 3500 memory
    for i in range (3203,3501):
        lst.append('0000000000000000')      

    # no of cores to be used
    if k>m :
        k = m
    if k>8 :
        k=8

    # deviding rows for cores
    M=[0,0,0,0,0,0,0,0]
    
    for i in range(k):
        M[i]=m//k
    for i in range(m%k):
        M[i]+=1

    # bases of A
    base_A = []
    base_C = []
    x1 = 128 # starting point of bace A
    x2 = 2176 # starting point of base C
    
    for i in range(8):
        if M[i]==0 :
            base_A.append("0000000000000000")
            base_C.append("0000000000000000")
        else:
            base_A.append('{0:016b}'.format(x1))
            base_C.append('{0:016b}'.format(x2))
        x1 += M[i]*q
        x2 += M[i]*n
    lst += base_A
    lst += base_C 

    # slots for i,j,k and r
    for i in range(32):
        lst.append('0000000000000000')

    # adding M
    for i in range(8) :
        M[i]='{0:016b}'.format(M[i]) 
    lst += M
    
    return(lst,k)

                    
def Output(lst,Output_file):
    with open(Output_file,"w")as Output:
        for element in lst:
            Output.write(element + "\n")
    
k = int(input("Enter the maximum number of cores to be utilized: "))

print("----------------------------------------------------------------")

# main program
lst = getIns("Instructions.txt")
A,m,q = getMat("A.txt")
B,q,n = getMat("B.txt")
lst2,k = writeOutput(lst,k,m,q,n,A,B)
print("\n",k,"core(s) will be utilized for the computation")
print("\n","expected Outcome is : ")
C = getOutput(A,B,m,q,n)
Output(C,"C.txt")
print("\n","Restart the simulation...")
Output(lst2,"Memory_file.txt")
x = input("Enter any key to end the program : ")
