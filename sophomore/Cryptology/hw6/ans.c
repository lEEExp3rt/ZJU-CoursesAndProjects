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
#pragma warning(disable : 4996)

void scan_hex(unsigned char *p, int n, unsigned char *q)
{
   for (int i = 0; i < n; i++)
   {
      sscanf((char *)&p[i * 2], "%02X", &q[i]);
   }
}

int main()
{
   char N0[0x101], E0[0x101], N1[0x101], D1[0x101];
   char cipher_text[0x101], sign_hex[0x101];
   unsigned char plain_text[0x101];
   unsigned char bufin[0x101], bufout[0x101], padded_md5[0x101], md5[0x101];
   gets(N0);
   gets(E0);
   gets(N1);
   gets(D1);
   gets(cipher_text);
   gets(sign_hex);

   /* Here is your code */
   char D0[0x101], E1[0x101];
   RSA *prsa1, *prsa2;
   BIGNUM *pn0, *pe0, *pd0, *pd1, *pn1, *pe1;
   int n;
   prsa1 = RSA_new();
   prsa1->flags |= RSA_FLAG_NO_BLINDING;
   prsa1->flags &= ~RSA_FLAG_CACHE_PUBLIC;
   prsa1->flags &= ~RSA_FLAG_CACHE_PRIVATE;
   prsa2 = RSA_new();
   prsa2->flags |= RSA_FLAG_NO_BLINDING;

   prsa2->flags &= ~RSA_FLAG_CACHE_PUBLIC;
   prsa2->flags &= ~RSA_FLAG_CACHE_PRIVATE;
   pn0 = BN_new();
   pe0 = BN_new();
   pd0 = BN_new();
   pd1 = BN_new();
   pn1 = BN_new();
   pe1 = BN_new();
   BN_hex2bn(&pn0, N0);
   BN_hex2bn(&pe0, E0);
   BN_hex2bn(&pn1, N1);
   BN_hex2bn(&pd1, D1);
   BN_hex2bn(&pd0, D0);
   BN_hex2bn(&pe1, E1);

   n = strlen((char *)cipher_text) / 2;
   scan_hex(cipher_text, n, bufin);
   unsigned char bufoutme[0x101];
   memset(bufoutme, 0, sizeof(bufoutme));
   prsa2->n = pn1;
   prsa2->d = pd1;
   prsa2->e = NULL;
   n = RSA_private_decrypt(n, bufin, bufoutme, prsa2, RSA_PKCS1_PADDING);
   strncpy((char *)plain_text, (char *)bufoutme, n);
   BIGNUM *sign;
   sign = BN_new();
   BN_hex2bn(&sign, sign_hex);
   BIGNUM *bn_padded_md5 = BN_new();
   BN_CTX *bn_ctx = BN_CTX_new();
   BN_mod_exp(bn_padded_md5, sign, pe0, pn0, bn_ctx);
   int padded_len = BN_num_bytes(bn_padded_md5);
   unsigned char *padded_md5_buf = malloc(padded_len);
   BN_bn2bin(bn_padded_md5, padded_md5_buf);

   if (padded_md5_buf[0] == 0x02)
   {
      unsigned char temp_pad[17];
      unsigned char temp_plain[17];
      char pad_bin[17];
      char plain_bin[17];
      memcpy(temp_pad, &padded_md5_buf[111], 16);
      temp_pad[16] = '\0';
      MD5(plain_text, n, temp_plain);
      for (int i = 0; i < 16; ++i)
      {
         sprintf(&pad_bin[i], "%x", temp_pad[i]);
         sprintf(&plain_bin[i], "%x", temp_plain[i]);
      }
      pad_bin[16] = '\0';
      plain_bin[16] = '\0';
      if (strcmp(pad_bin, plain_bin) != 0)
      {
         memset(plain_text, 0, sizeof(plain_text));
         strcpy((char *)plain_text, "BAD");
         n = 4;
      }
   }
   else
   {
      memset(plain_text, 0, sizeof(plain_text));
      strcpy((char *)plain_text, "BAD");
      n = 4;
   }
   prsa1->n = pn0;
   prsa1->e = pe0;
   prsa1->d = NULL;
   memset(bufin, 0, sizeof(bufin));
   strncpy((char *)bufin, (char *)plain_text, n);
   int new_cipher_len = RSA_public_encrypt(n, bufin, bufout, prsa1, RSA_PKCS1_PADDING);
   for (int i = 0; i < new_cipher_len; i++)
   {
      sprintf((char *)&cipher_text[i * 2], "%02X", bufout[i]);
   }

   unsigned char x[20];
   MD5(plain_text, n, x);

   prsa2->n = pn1;
   prsa2->e = NULL;
   prsa2->d = pd1;
   int sign_len = RSA_private_encrypt(16, x, bufout, prsa2, RSA_PKCS1_PADDING);
   if (sign_len < 0)
   {
      printf("Signing failed\n");
      return -1;
   }

   for (int i = 0; i < sign_len; i++)
   {
      sprintf((char *)&sign_hex[i * 2], "%02X", bufout[i]);
   }

   RSA_free(prsa1);
   RSA_free(prsa2);
   BN_free(pn0);
   BN_free(pe0);
   BN_free(pd0);
   BN_free(pd1);
   BN_free(pn1);
   BN_free(pe1);
   BN_free(sign);
   BN_free(bn_padded_md5);
   BN_CTX_free(bn_ctx);

   puts(cipher_text); /* ======================== */
   puts(sign_hex);    /* ��������Ҫ�����2��,     */
                      /* �������ⲻ�����б����� */
                      /* ======================== */
   return 0;
}