# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "hash-utils/object"
require "hash-utils/array"
require "mapper/some"
require "mapper/all"

##
# Represents mapped objects holder.
#

class Mapper < Array
    
    ##
    # ALL reductor instance.
    #
    
    @all
    
    ##
    # SOME reductor default instance.
    #
    
    @some
    
    ##
    # Alias for #new.
    # @see {#initialize}
    #
    
    def self.[](*args)
        self::new(*args)
    end

    ##
    # Constructor.
    #
    # If only one argument, and it's Array, content will be treaten as 
    # matter for mapping.
    #
    
    def initialize(*objs)
        if (objs.length == 1) and (objs.first.kind_of? Array)
            self.merge! objs.first
        else
            self.merge! objs
        end
    end
    
    ##
    # Produces reductor which passes call with given arguments to 
    # each object.
    # 
    
    def all
        if @all.nil?
            @all = All::new(self)
        end
        
        return @all
    end
    
    ##
    # Produces reductor which passes call with given arguments to
    # each object from oldest to newest in aggregator if the output of
    # given block isn't +true+.
    #
    
    def some(&block)
    
        # Returns from cache
        if not @some.nil? and block.nil?
            return @some
        end
    
        # In otherwise, creates new
        default = false
        
        if block.nil?
            block = Proc::new { |v| v.to_b }
            default = true
        end

        some = Some::new(self, &block)
        
        if (default == true) and @some.nil?
            @some = some
        end
        
        return some
    end

end
