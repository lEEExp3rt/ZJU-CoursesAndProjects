/*
 *File:queue.h
 *This file provideds an interface to a simple queue
 *abstraction.
*/
#ifndef _queue_h
#define _queue_h

#include"genlib.h"

typedef struct queueCDT *queueADT

/*
 *Function:NewQueue
 *THis function allocates and returns an empty queue.
 *Usage:queue=NewQueue()
*/
queueADT NewQueue(void)

/*
 *Function:FreeQueue
 *This function frees the storage associated with queue
 *Usage:FreeQueue(queue)
*/
void FreeQueue(queueADT queue)

/*
 *Function:EnQueue
 *This function adds object to the end of the queue.
 *Usage:Enqueue(queue,obj)
*/
void Enqueue(queueADT queue,void *obj)

/*
 *Function:Dequeue
 *This function removes the data value at the head of
 *the queue and returns it to the client . Dequeueing 
 *an empty queue is an error.
 *Usage:obj=Dqueue(queue);
*/
void *Dequeue(queueADT queue)

/*
 *Function:QueueLength
 *This function returns the number of elements in the 
 *queue.
 *Usage:n=QueueLength(queue)
*/
int QueueLength(queueADT queue)

#endif