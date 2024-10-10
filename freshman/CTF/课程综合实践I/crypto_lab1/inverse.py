def inverse(n,m): #m是模
    for d in range(1,n+1): 
        if (1+m*d)%n==0: 
            break 
        return int((1+m*d)/n)
