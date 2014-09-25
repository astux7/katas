Bloom filter

So, this kata is fairly straightforward. Implement a Bloom filter based spell checker. You’ll need some kind of bitmap, some hash functions, and a simple way of reading in the dictionary and then the words to check. For the hash function, remember that you can always use something that generates a fairly long hash (such as MD5) and then take your smaller hash values by extracting sequences of bits from the result. On a Unix box you can find a list of words in /usr/dict/words (or possibly in /usr/share/dict/words). For others, I’ve put a word list up here.1

Play with using different numbers of hashes, and with different bitmap sizes.

Part two of the exercise is optional. Try generating random 5-character words and feeding them in to your spell checker. For each word that it says it OK, look it up in the original dictionary. See how many false positives you get.

More explanation (https://www.adayinthelifeof.nl/2012/04/09/bloom-filters/)
====================
How does it work
How can a data structure tell us either “no” or “maybe”. Can’t it just tell use “yes” or “no”? Well.,.. no.. :)  Let’s take a look how a bloom filter is made out of:
We have a bit-array of “m” bits. Let’s say, m = 20. Each of these bits are set to 0.

0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
-----------------------------------------
                    1 1 1 1 1 1 1 1 1 1 2
0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0

Now, we have a number of hash functions. This amount is called “k”. A hash function is a function that turns a block of data into a number, in our case a number between 0 and m. These hash functions are pretty similar to md5, crc32 and sha1, but are much faster. Now, what happens is that when we add data to our bloom filter, this data gets hashed by all the hashes in the bloom filter (so k times). Let’s assume the following:

    data: “key1″
    k1(key1) = 4
    k2(key1) = 3
    k3(key1) = 15

This means: our data “key1″ is hashed to 4, 3 and 15 according to our hashes. Now, the bloom filter will set these bits in our array to 1.

0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0
-----------------------------------------
                    1 1 1 1 1 1 1 1 1 1 2
0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0

Let’s add another key:

    data: “another key”
    k1(key1) = 8
    k2(key1) = 19
    k3(key1) = 3

And of course, add these numbers to our array as well:

0 0 0 1 1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0
-----------------------------------------
                    1 1 1 1 1 1 1 1 1 1 2
0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0

You see that the “3″ was already set, so it stays set to 1. Now, let’s ask our bloom filter if “somekey” is present. We start the same way as adding data: we use the same hash functions:

    data: “some key”
    k1(key1) = 1
    k2(key1) = 10
    k3(key1) = 19

Now we search the bloom filter and find if ALL of these bits are set to 1. In this case, only bit 19 is set, but bit 1 and bit 10 aren’t. We can say for 100% certainty that “some key” is NOT in our bloom filter.
But let’s try with “key1″. We already know that the hashes will be 4, 3 and 15. And all these bits are set inside our bloom filter. Now, you might be tempted to think that we can just return a “yes”, but there is a problem with this. Let’s try another key:

    data: “unknown key”
    k1(key1) = 3
    k2(key1) = 19
    k3(key1) = 4

If we are checking for this key in our filter, we actually see that bits 3, 4 AND 19 are all set, yet we never have added this key to the bloom filter! This is because these hash all return numbers that have previously been set by other keys and this is where the “maybe” comes from. The bloom filter cannot know if these bits happen to be there because you’ve added the key to the set, or that by coincidence all bits happened to be set by other keys.


ALSO (http://lkozma.net/blog/sketching-data-structures/)
=================
Initial configuration: 0000000000
Insert("Sally")      : 0100000001
   # h1("Sally") = 2, h2("Sally") = 10
Insert("Jane")       : 1110000001
   # h1("Jane") = 1, h2("Jane") = 3
Insert("Mary")       : 1110100001
   # h1("Mary") = 5, h2("Mary") = 2 [collision]

Query("Sally")
   # bits 2 and 10 are set,
   # return HIT
Query("John")
   # h1("John") = 10 set, but h2("John") = 4 not set
   # return MISS
Query("Bob")
   # h1("Bob") = 5 set, h2("Bob") = 1 set
   # return HIT (false positive)
