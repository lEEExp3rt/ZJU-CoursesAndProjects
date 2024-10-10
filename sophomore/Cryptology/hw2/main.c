#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char plugboard[27]="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
               /* e.g. "ZBCDEFGHIJKLMNOPQRSTUVWXYA" means 'A' & 'Z' are swapped */
char rotor[4]; /* total 3 rotor numbers */
               /* e.g. rotor[0]=1, rotor[1]=2, rotor[2]=3 means
                  the left most rotor number is 1, the right most rotor number is 3
                */
char ring[4];  /* ring setting from left to right, e.g.
                  "UJZ" means 'U' is the ring setting for the
                  left most rotor, 'Z' is the ring setting for the right most rotor
                */
char key[4];   /* message key from left to right, e.g.
                  "CBA" means 'C' is the message key for the
                  left most rotor, 'A' is the message key for the right most rotor
                */
char rotor_table[5][27] =
{
   "EKMFLGDQVZNTOWYHXUSPAIBRCJ",
   "AJDKSIRUXBLHWTMCQGZNPYFVOE",
   "BDFHJLCPRTXVZNYEIWGAKMUSQO",
   "ESOVPZJAYQUIRHXLNFTGKDCMWB",
   "VZBRGITYUPSDNHLXAWMJQOFECK"
};
char reflector[]="YRUHQSLDPXNGOKMIEBFZCWVJAT"; /* ReflectorWide_B */
char step_char[6]="RFWKA"; /* Royal Flags Wave Kings Above */

char r_rotor_table[5][27];
char rotor_permutation[60][0x20];

// Create a reverse rotor table.
void reverse_table(void)
{
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 26; j++)
            r_rotor_table[i][rotor_table[i][j] - 'A'] = 'A' + j;
    }
    return ;
}

// Select 3 items from total 5 items and place in order, no duplicate.
void permutation(void)
{
    int i, j, k;
    int cnt = 0;
    char tmp[4];
    tmp[3] = '\0';
    for (i = 1; i < 6; i++) {
        tmp[0] = '0' + i;
        for (j = 1; j < 6; j++) {
            if (j == i)
                continue;
            tmp[1] = '0' + j;
            for (k = 1; k < 6; k++) {
                if (k == i || k == j)
                    continue;
                tmp[2] = '0' + k;
                strcopy(rotor_permutation[cnt++], tmp, 3);
            }
        }
    }
    return ;
}

// Make the rotor rotated.
char Rotate(char obj)
{
    return (obj - 'A' + 1) % 26 + 'A';
}

// Map an element in the table.
char Map(char obj, char key, char ring, char table[])
{
    int delta = key - ring;
    char ans = (obj - 'A' + delta + 26) % 26 + 'A';
    ans = table[ans - 'A'];
    ans = (ans - 'A' - delta + 26) % 26 + 'A';
    return ans;
}

void Enigma(char cipher[], char plain[])
{
    for (int i = 0; i < strlen(cipher); i++) {
        char tmp = plugboard[cipher[i] - 'A']; // Go into the plugboard.
        // Count up.
        if (key[0] == step_char[rotor[0] - '1'] - 1)
            key[1] = Rotate(key[1]);
        // Double stepping.
        else if (key[1] == step_char[rotor[1] - '1'] - 1) {
            key[1] = Rotate(key[1]);
            key[2] = Rotate(key[2]);
        }
        key[0] = Rotate(key[0]); // Rotor1 rotates.

        tmp = Map(tmp, key[0], ring[0], rotor_table[rotor[0] - '1']);
        tmp = Map(tmp, key[1], ring[1], rotor_table[rotor[1] - '1']);
        tmp = Map(tmp, key[2], ring[2], rotor_table[rotor[2] - '1']);
        tmp = Map(tmp, '0', '0', reflector);
        tmp = Map(tmp, key[2], ring[2], r_rotor_table[rotor[2] - '1']);
        tmp = Map(tmp, key[1], ring[1], r_rotor_table[rotor[1] - '1']);
        tmp = Map(tmp, key[0], ring[0], r_rotor_table[rotor[0] - '1']);

        plain[i] = plugboard[tmp - 'A'];
    }
}

// Copy string in inverse order.
void strcopy(char dest[], char src[], int len)
{
    for (int i = 0; i < len; i++)
        dest[i] = src[len - i - 1];
    dest[len] = '\0';
    return ;
}

int main()
{
    char init_plug[0x20]="AB CD EF GH IJ KL MN OP QR ST";
    for (int i = 0; i < 0x20; i += 3) {
        if (init_plug[i] >= 'A' && init_plug[i] <= 'Z') {
            plugboard[init_plug[i] - 'A'] = init_plug[i + 1];
            plugboard[init_plug[i + 1] - 'A'] = init_plug[i];
        }
        else
            break;
    }
    char init_ring[0x20]="UJZ";
    strcopy(ring, init_ring, 3);
    char cipher[0x100];
    char key_word[0x100];
    char plain[0x100];
    char init_key[0x20];
    char init_rotor[0x20];
    init_rotor[3] = '\0';
    init_key[3] = '\0';

    gets(cipher);   /* 输入密文 */
    gets(key_word); /* 输入明文中一定包含的单词 */

    reverse_table();
    permutation();

    int k2 = 25, k1 = 25, k0 = 25;
    int cnt = 0;
    /*
    init_rotor[0] = '5';
    init_rotor[1] = '3';
    init_rotor[2] = '1';
    strcopy(rotor, init_rotor, 3);
    init_key[0] = 'U';
    init_key[1] = 'J';
    init_key[2] = 'Z';
    strcopy(key, init_key, 3);
    */
    do
    {
        /* 穷举rotor及key并对cipher进行解密生成明文plain */
        /* ============================================= */
        /* 请在此处把代码补充完整                        */
        /* ============================================= */
        k0++;
        if (k0 == 26) {
            k0 = 0;
            k1++;
            if (k1 == 26) {
                k1 = 0;
                k2++;
                if (k2 == 26) {
                    k2 = 0; 
                    strcopy(init_rotor, rotor_permutation[cnt++], 3);
                    strcopy(rotor, init_rotor, 3);
                }
                init_key[2] = 'A' + k2;
            }
            init_key[1] = 'A' + k1;
        }
        init_key[0] = 'A' + k0;
        strcopy(key, init_key, 3);
        Enigma(cipher, plain);
    } while(strstr(plain, key_word) == NULL); /* 若在明文中找不到关键词则继续循环 */
    puts(init_rotor);
    puts(init_key);
    puts(plain);
    return 0;
}
