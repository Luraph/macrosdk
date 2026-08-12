if not LPH_OBFUSCATED then

    -- Macros:

    LPH_ENCSTR = function(n) return n end
    LPH_ENCNUM = function(n) return n end

    LPH_STRENC = function(n) return n end
    LPH_NUMENC = function(n) return n end

    if buffer then

        local buffer_fromstring = buffer.fromstring
        
        LPH_ENCBUF = function(n) return buffer_fromstring(n) end
        LPH_BUFENC = function(n) return buffer_fromstring(n) end
        
    end
     
    LPH_CRASH = function() end

    do

        local table_unpack = table.unpack or unpack
        local table_pack = table.pack or function(...) return { n = select("#", ...), ... } end

        local __stackalloc = { }
        __stackalloc.__index = __stackalloc

        __stackalloc.clear = function(self, first, last) 

            first = first or self.__base
            last = last or self.__end
            
            for i = first, last do self[i] = nil end 

        end

        __stackalloc.unpack = function(self, first, last) 

            first = first or self.__base
            last = last or self.__end
            
            return table_unpack(self, first, last) 
        
        end

        __stackalloc.pack = function(self, first, last) 
            
            first = first or self.__base
            last = last or self.__end

            return table_pack(table_unpack(self, first, last))
        
        end
        
        __stackalloc.__len = function(self) return self.__size end
        
        LPH_STACKALLOC = function(size, base)

            base = base or 0

            local allocation = { }
            allocation.__size = size
            allocation.__base = base
            allocation.__end = base + size - 1

            return setmetatable(allocation, __stackalloc)

        end

    end

    LPH_PRECHECK = function(check) check() end

    LPH_REWRITE = function(e) return e end

    -- Attributes:

    local __attribute = function() end

    LPH_ATTRIBUTES = __attribute

    ENCRYPT = __attribute

    VM = __attribute
    PRESET = __attribute
    OPTIMIZE = __attribute
    NO_UPVALUES = __attribute
    ERROR_HANDLING = __attribute

    UNROLL = __attribute
    INLINE = __attribute

    TRANSFORM = __attribute

    -- VM Options:

    NONE = __attribute
    OPAL = __attribute
    ONYX = __attribute

    -- PRESET Options:

    FAST = __attribute
    BALANCED = __attribute
    SECURE = __attribute

    -- TRANSFORM Options:

    EXTRACT = __attribute
    CONTROL_FLOW = __attribute
    REWRITE_NAMECALLS = __attribute

    -- EXTRACT Options:

    GLOBALS = __attribute
    CONSTANTS = __attribute

end
