class Floor
    attr_accessor :id, :no_of_slots, :slots

    def initialize(id,no_of_slots)
        @id = id
        @no_of_slots = no_of_slots
        @slots = []
    end
end