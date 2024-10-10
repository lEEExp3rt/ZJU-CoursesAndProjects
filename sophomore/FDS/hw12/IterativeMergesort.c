#include <stdio.h>

#define ElementType int
#define MAXN 100

void merge_pass( ElementType list[], ElementType sorted[], int N, int length );

void output( ElementType list[], int N )
{
    int i;
    for (i=0; i<N; i++) printf("%d ", list[i]);
    printf("\n");
}

void  merge_sort( ElementType list[],  int N )
{
    ElementType extra[MAXN];  /* the extra space required */
    int  length = 1;  /* current length of sublist being merged */
    while( length < N ) {
        merge_pass( list, extra, N, length ); /* merge list into extra */
        output( extra, N );
        length *= 2;
        merge_pass( extra, list, N, length ); /* merge extra back to list */
        output( list, N );
        length *= 2;
    }
}


int main()
{
    int N, i;
    ElementType A[MAXN];

    scanf("%d", &N);
    for (i=0; i<N; i++) scanf("%d", &A[i]);
    merge_sort(A, N);
    output(A, N);

    return 0;
}

/* Your function will be put here */

void merge_pass( ElementType list[], ElementType sorted[], int N, int length )
{
    for (int index = 0; index < N; index += 2 * length)
    {
        int i1 = index, i2 = index + length, len = 0;
        while (i1 < index + length && i2 < index + 2 * length && i1 < N && i2 < N)
        {
            sorted[index + len++] = list[i1] < list[i2] ? list[i1++] : list[i2++];
        }
        while (index + length - i1)
        {
            if (i1 >= N) break;
            sorted[index + len++] = list[i1++];
        }
        while (index + 2 * length - i2)
        {
            if (i2 >= N) break;
            sorted[index + len++] = list[i2++];
        }
    }
    return ;
}
