with open("hex.txt",'r') as f:
    content=f.read()
    
print(content.replace('\n','').replace("skullseclabs.org","").replace(".",''))
