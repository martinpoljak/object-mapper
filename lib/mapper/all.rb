# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# Represents mapped objects holder.
#

class Mapper < Array
    
    ##
    # Reductor which simply returns array of results for all objects.
    #
    
    class All

        ##
        # Holds aggregated objects.
        #
        
        @objects
        
        ##
        # Constructor.
        #
        
        def initialize(objects)
            @objects = objects
        end
        
        ##
        # Handles calls. (Performs mapping.)
        #
        
        def method_missing(name, *args, &block)
            result = @objects.map { |i| i.send(name, *args, &block) }
        end

    end
end
