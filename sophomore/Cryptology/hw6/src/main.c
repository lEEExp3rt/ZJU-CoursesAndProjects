#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <openssl/rsa.h>
#include <openssl/bn.h>
#include <openssl/md5.h>
#include <openssl/rand.h>
#ifdef _MSC_VER
#pragma comment(lib, "libeay32.lib")
#pragma comment(lib, "ssleay32.lib")
#endif

int main()
{
    char N0[0x101], E0[0x101], N1[0x101], D1[0x101];
    char cipher_text[0x101], sign_hex[0x101];
    unsigned char plain_text[0x101];
    unsigned char bufin[0x101], bufout[0x101], padded_md5[0x101], md5[0x101];

    /* 1 */
    gets(N0);
    gets(E0);
    gets(N1);
    gets(D1);
    gets(cipher_text);
    gets(sign_hex);

    /* Here is your code */
    /* 2 */
    unsigned char cipher_bin[0x80];
    for (int i = 0; i < 0x80; i++) {
        sscanf((char)&cipher_text[i * 2], "%02X", &cipher_bin[i]);
        //cipher_bin[i / 2] = (cipher_text[i] < 'A' ? (cipher_text[i] - '0') : (cipher_text[i] - 'A' + 10)) << 4 | (cipher_text[i + 1] < 'A' ? (cipher_text[i + 1] - '0') : (cipher_text[i + 1] - 'A' + 10));
    }

    RSA* RSA_private_key1 = RSA_new();
    RSA_private_key1->flags |= RSA_FLAG_NO_BLINDING;
    RSA_private_key1->flags &= ~RSA_FLAG_CACHE_PUBLIC;
    RSA_private_key1->flags &= ~RSA_FLAG_CACHE_PRIVATE;
    BIGNUM *n1_bn = BN_new();
    BN_hex2bn(&n1_bn, N1); // n1_bn = N1
    BIGNUM *d1_bn = BN_new();
    BN_hex2bn(&d1_bn, D1); // d1_bn = D1
    RSA_private_key1->n = n1_bn;
    RSA_private_key1->d = d1_bn;
    RSA_private_key1->e = NULL;
    int plain_text_len = RSA_private_decrypt(0x80, cipher_bin, bufout, RSA_private_key1, RSA_PKCS1_PADDING);
    strncpy((char*)plain_text, (char*)bufout, plain_text_len);
    /* 3 */
    BIGNUM *n0_bn = BN_new();
    BN_hex2bn(&n0_bn, N0); // n0_bn = N0
    BIGNUM *e0_bn = BN_new();
    BN_hex2bn(&e0_bn, E0); // e0_bn = E0
    BIGNUM *sign = BN_new();
    BN_hex2bn(&sign, sign_hex); // sign = sign_hex
    BIGNUM *padded_md5_bn = BN_new();
    BN_mod_exp(padded_md5_bn, sign, e0_bn, n0_bn, BN_CTX_new()); // padded_md5 = sign^e0 mod n0
    int padded_md5_len = BN_num_bytes(padded_md5_bn);
    unsigned char* padded_md5_ = (unsigned char*)malloc(padded_md5_len);
    BN_bn2bin(padded_md5_bn, padded_md5_);
    int i;
    for (i = 0; i < 0x80 - padded_md5_len; i++) {
        padded_md5[i] = 0x00;
    }
    i++;
    for (int j; j < padded_md5_len; j++) {
        padded_md5[i + j] = padded_md5_[j];
    }
    /* 4 */
    // Check if the padded_md5's type.
    if ((padded_md5[0] == 0x00) && (padded_md5[1] == 0x02) && (padded_md5[111] == 0x00)) {
        unsigned char md5_[16];
        for (int i = 15; i >= 0; i--) {
            md5_[i] = padded_md5[i + 111];
        }
        unsigned char expected_md5[16];
        MD5(plain_text, plain_text_len, expected_md5);
        if (memcmp(md5_, expected_md5, 16) != 0) {
            plain_text[0] = 'B';
            plain_text[1] = 'A';
            plain_text[2] = 'D';
            plain_text[3] = '\0';
            plain_text_len = 4;
        }
    } else {
        plain_text[0] = 'B';
        plain_text[1] = 'A';
        plain_text[2] = 'D';
        plain_text[3] = '\0';
        plain_text_len = 4;
    }

    /* 5 */
    RSA* RSA_public_key1 = RSA_new();
    RSA_public_key1->flags |= RSA_FLAG_NO_BLINDING;
    RSA_public_key1->flags &= ~RSA_FLAG_CACHE_PUBLIC;
    RSA_public_key1->flags &= ~RSA_FLAG_CACHE_PRIVATE;
    RSA_public_key1->n = n0_bn;
    RSA_public_key1->e = e0_bn;
    RSA_public_key1->d = NULL;

    strncpy((char*)bufin, (char*)plain_text, plain_text_len);
    int cipher_text_len = RSA_public_encrypt(plain_text_len, bufin, bufout, RSA_public_key1, RSA_PKCS1_PADDING);
    for (int i = 0; i < cipher_text_len; i++) {
        sprintf((char*)&cipher_text[i * 2], "%02X", bufout[i]);
    }

    /* 6 */
    MD5(plain_text, plain_text_len, md5);
    RSA* RSA_private_key2 = RSA_new();
    RSA_private_key2->flags |= RSA_FLAG_NO_BLINDING;
    RSA_private_key2->flags &= ~RSA_FLAG_CACHE_PUBLIC;
    RSA_private_key2->flags &= ~RSA_FLAG_CACHE_PRIVATE;
    RSA_private_key2->n = n1_bn;
    RSA_private_key2->d = d1_bn;
    RSA_private_key2->e = NULL;
    int sign_len = RSA_private_encrypt(16, md5, bufout, RSA_private_key2, RSA_PKCS1_PADDING);
    for (int i = 0; i < sign_len; i++) {
        sprintf((char*)&sign_hex[i * 2], "%02X", bufout[i]);
    }

    puts(cipher_text); /* ======================== */
    puts(sign_hex);    /* 程序最终要输出这2项,      */
                       /* 除此以外不可以有别的输出   */
                       /* ======================== */
    return 0;
}