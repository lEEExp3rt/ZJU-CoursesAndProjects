/*
 *File:queue.c
 *This file implements the queue.h abstraction using 
 *an array.
 */

#include<stdio.h>
#include"genlib.h"
#include"queue.h"

/*
 *Constants:
 *-----------
 *MaxQueueSize -- Maximum number of elements in the 
 *queue
 */
#define MaxQueueSize 10

/*
 *type:queueCDT
 */
typedef struct {
    void *array[MaxQueueSize];
    int len;
}queueCDT;

/*Exported entries*/

/*
 *Functions:NewQueue,FreeQueue
 */
queueADT NewQueue(void)
{
    queueADT queue;
    //queue=(queueADT)malloc(sizeof(queue));
    queue=New(queueADT);
    queue->len=0;
    return (queue);
}

void FreeQueue(queueADT queue)
{
    FreeBlock(queue);
}

/*
 *Function:EnQueue
 */
void EnQueue(queueADT queue,void *obj)
{
    if (queue->len==MaxQueueSize) {
        Error("EnQueue called on a full queue");
    }
    queue->array[queue->len++]=obj;
}

/*
 *Function:DeQueue
 */
void *DeQueue(queueADT queue)
{
    void *result;
    int i;
    if (queue->len==0) Error("DeQueue of empty queue");
    result=queue->array[0];
    for (i=1;i<queue->len;i++){
        queue->array[i-1]=queue->array[i];
    }
    queue->len--;
    return result;
}

/*
 *Funcion:QueueLength
 */
int QueueLength(queueADT queue)
{
    return (queue->len);
}