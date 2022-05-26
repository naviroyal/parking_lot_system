class Ticket
    attr_accessor :floor_no,:slot_no

    def initialize(floor_no,slot_no)
        @floor_no = floor_no
        @slot_no = slot_no
    end
end