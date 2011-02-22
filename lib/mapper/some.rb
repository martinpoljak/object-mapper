# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# Represents mapped objects holder.
#

class Mapper < Array

    ##
    # "One after one" reductor.
    #
    # Passes call with given arguments to each object from oldest to 
    # newest in aggregator if the output of given block isn't +true+.
    #
    
    class Some

        ##
        # Holds aggregated objects.
        #
        
        @objects
        
        ##
        # Holds "some" condition.
        #
        
        @condition
        
        ##
        # Constructor.
        #
        
        def initialize(objects, &block)
            @objects = objects
            @condition = block
        end
        
        ##
        # Handles calls. (Performs mapping.)
        #
        # Returns result of first one for which is condition +true+,
        # or result of last object call.
        #
        
        def method_missing(name, *args, &block)
            result = nil
            
            @objects.each do |obj|
                result = obj.send(name, *args, &block)
                
                if @condition.call(result)
                    return result
                end
            end
            
            return result
        end

    end
end
