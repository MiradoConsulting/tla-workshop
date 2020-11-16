Immutable ("persistent") data types are great.  They can be copied, shared, and they cannot introduce concurrency problems into your code.

A _persistent list_ can either be _Empty_ or a _Node_, which holds a value, as well as a pointer to the rest of the list.

A _persistent list_ can be used to build a _persistent queue_:\
![queue](https://github.com/MiradoConsulting/tla-workshop/blob/main/images/queue.png)

The above is the result of enqueueing 1, 2, 3.

Since the queue above cannot change, when we enqueue 4, we can simply point it the existing queue, meaning enqueue is really cheap (O(1)):\
![queue](https://github.com/MiradoConsulting/tla-workshop/blob/main/images/cheap-enqueue.png)

However, dequeues require us to change the oldest side of the queue.  We can't modify so we need to construct a new queue, making dequeues really expensive (O(n)):\
![queue](https://github.com/MiradoConsulting/tla-workshop/blob/main/images/expensive-dequeue.png)

There is a trick to getting cheaper dequeues, which is to build a queue out of two lists - a _front_ (blue) and a _back_ (green).  The _front_ list uses the same order as before, but the _back_ list stores its items in reverse order.  That is, ([6,5,4], [1,2,3]) is a possible representation after enqueuing 1,2,3,4,5,6.\
![queue](https://github.com/MiradoConsulting/tla-workshop/blob/main/images/two-lists.png)

Now dequeue is cheap (O(1)) using this layout, since you can just 'pop' from the _back_ list:\
![queue](https://github.com/MiradoConsulting/tla-workshop/blob/main/images/cheap-dequeue.png)

And enqueues are still cheap (O(1)) since you're just pushing onto the _front_ list:\
![queue](https://github.com/MiradoConsulting/tla-workshop/blob/main/images/cheap-enqueue-2.png)

What happens when you run out of _back_ list?
![queue](https://github.com/MiradoConsulting/tla-workshop/blob/main/images/empty-back.png)

The _back_ list becomes the reverse of the _front_ list, and the _front_ list is cleared:\
![queue](https://github.com/MiradoConsulting/tla-workshop/blob/main/images/reversed-back.png)

It costs O(n) to reverse a list.  So if 8 items travel through the queue, we could say:
* 8 * O(1) enqueue
* 8 * O(1) dequeue
* 1 * O(8) reversal

It's not fair to claim O(1) enqueue and O(1) dequeue if there's a large O(n) hidden cost, but it is fair if we amortize the cost of the reversal O(8) over the other 8 operations.
* 8 * (O(1) enqueue)
* 8 * (O(1) dequeue + O(8/8) part of reverse)

Is this reasoning a bit 'fast and loose'?  Let's see if we can prove its functionality and perhaps even its cost using TLA+.
