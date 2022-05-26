class Slot
    attr_accessor :isEmpty, :id

    def initialize(isEmpty=true,id)
        @isEmpty = isEmpty
        @id = id
    end
end