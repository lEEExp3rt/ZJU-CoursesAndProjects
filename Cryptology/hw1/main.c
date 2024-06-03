#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/* xgcd()函数的返回值为gcd(x,y), *pinverse是x mod y的乘法逆元;
   例如xgcd(3, 20, &inv)的返回值为1, 变量inv将被赋值为7, 即3 mod 20的乘法逆元。
 */
int xgcd(int x, int y, int *pinverse)
{
   int a1=1, b1=0, a2=0, b2=1;
   int q, r, t, n, old_n;
   if(x > y)
   {
      t = x;
      x = y;
      y = t;
   }
   n = y;
   r = x;
   while(r != 0)
   {
      q = n / r;
      t = a1;
      a1 = a2;
      a2 = t - q*a2;
      t = b1;
      b1 = b2;
      b2 = t - q*b2;
      t = n;
      n = r;
      r = t % r;
   }
   a1 = (a1+y) % y;
   b1 = (b1+y) % y;
   *pinverse = b1;
   return n;
}

int main()
{
   /* (1)输入一个由4个大写字母构成的字符串设为s, s包含的4个元素的关系如下:
         s[1] = (a * (s[0]-'A') + b) % 26 + 'A'; // s[0]-'A'是明文, s[1]-'A'是密文
         s[3] = (a * (s[2]-'A') + b) % 26 + 'A'; // s[2]-'A'是明文, s[3]-'A'是密文
         上述加密过程采用仿射密码加密算法: y = a*x + b mod 26; 其中x为明文, y为密文。
         该仿射加密算法中的密钥a、b均为正整数, a的取值范围为[2,25], b的取值范围为[1,25], 
         并且a满足条件gcd(a, 26)==1;
         另外s包含的4个元素还满足以下条件: 
         gcd((s[1]-s[3]+26) % 26, 26)==1 || gcd((s[0]-s[2]+26) % 26, 26)==1
      (2)再输入一个由大写字母构成的字符串(长度不超过100字节), 试根据步骤(1)获得的线索
         用仿射密码解密算法(密钥a、b不变)对该字符串进行解密并用puts()输出解密所得字符串。
    */
   // -----------------------------------
   // 请在此处补充代码完成(1)(2)两个步骤
   // -----------------------------------
    char s[100];
    gets(s);
    int i, j, a, b;
    i = s[0] - 'A';
    j = s[2] - 'A';
    int c = (s[1] - s[3] + 26) % 26;
    if (c == 1) {
        int tmp;
        tmp = xgcd(i - j + 26, 26, &a);
    }
    else {
        int list[] = {3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25};
        int index = 0;
        while (list[index] * (i - j + 26) % 26 != c)
            index++;
        a = list[index];
    } 
    b = s[1] - 'A' - a * i;
    while (b < 0)
        b += 26;
    int p[26];
    for (int k = 0; k < 26; k++)
        p[(k * a + b) % 26] = k;
    s[0] = '\0';
    gets(s);
    for (int l = 0; l < strlen(s); l++)
        s[l] = 'A' + p[s[l] - 'A'];
    puts(s);
    return 0;
}
