class Vehicle
    attr_accessor :registration_no, :type, :color, :ticket

    def initialize(registration_no,type,color)
        @registration_no = registration_no
        @type = type
        @color = color
        @ticket = {}
    end
end