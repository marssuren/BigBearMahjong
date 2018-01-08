local setmetatable = setmetatable

Class = {}

function Class:new(super)
    local class = {}
    class.__index = class

    local mt = {}
    setmetatable(class, mt)
    if super then
        mt.__index = super
    end
    function class:new(...)
        local obj = {}
        setmetatable(obj, self)
        if obj.__new then
            obj:__new(...)
        end
        return obj
    end
    return class
end

return Class