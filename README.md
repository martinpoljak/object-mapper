Object Mapper
=============

**Object Mapper** provides interface for operations above set of objects 
in single call. Binds method calls to all contained objects according to 
specified rules. So, for example, it's possible to work with many hashes 
by rather native way as with single one without necessity to merge them. 
For example:

    require "mapper"
    
    h1 = {:a => :b}
    h2 = {:c => :d}
    h3 = {:a => :e}
    
    hashes = Mapper[h1, h2, h3]
    hashes.some.has_key? :a         # will return true
    hashes.some[:c]                 # will return :d
    
Conditions according which *some* reductor will return value can be 
changed. (It simply converts returned value of hash to boolean and 
returns it if conversion is `true`.) Let's change selector:

    hashes.some{ |v| v == :e }[:a]       
    
    # will return :e, because :b conversion of first hash to boolean 
    # is false, so will continue to second and then to third hash where 
    # :a will return :e which is correct and therefore it will 
    # be returned

This example is slightly non-sense for practical use, of sure, but 
demonstrates how selector works well. Second available reductor is 
*all* which simply returns all results of method calls for each 
hash (in array):

    hashes.all.has_key? :a          # will return [true, false, true]

Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b 20101220-my-change`).
3. Commit your changes (`git commit -am "Added something"`).
4. Push to the branch (`git push origin 20101220-my-change`).
5. Create an [Issue][2] with a link to your branch.
6. Enjoy a refreshing Diet Coke and wait.

Copyright
---------

Copyright &copy; 2011 [Martin Kozák][3]. See `LICENSE.txt` for
further details.

[2]: http://github.com/martinkozak/object-mapper/issues
[3]: http://www.martinkozak.net/
