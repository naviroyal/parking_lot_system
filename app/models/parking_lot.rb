require_relative "ticket"

class ParkingLot
    attr_accessor :no_of_floors, :floor_slot_mp, :vehicles

    def initialize(no_of_floors)
        @no_of_floors =no_of_floors
        @floor_slot_mp = Hash.new
        @vehicles = []
    end

    def get_free_slots(vehicle_type)
        free_slots = Hash.new
        if vehicle_type == "Car"
            floor_slot_mp.each do |key,value|
                free_slots[key] = []
                value.each do |slots|
                    free_slots[key] << slots if slots.id >= 4 && slots.isEmpty
                end
            end
        elsif vehicle_type == "Truck"
            floor_slot_mp.each do |key,value|
                free_slots[key] = []
                free_slots[key] << value[0] if value[0].id==1 && value[0].isEmpty
            end
        elsif vehicle_type == "Bike"
            floor_slot_mp.each do |key,value|
                free_slots[key] = []
                free_slots[key] << value[1] if value[1].id==2 && value[1].isEmpty
                free_slots[key] << value[2] if value[2].id==3 && value[2].isEmpty
            end
        end
        free_slots
    end

    def park_vehicle(vehicle)
        free_slots = get_free_slots(vehicle.type)
        free_slots.each do |key,value|
            value.each do |slot|
                vehicle.ticket = Ticket.new(key.id,slot.id)
                floor_slot_mp.each do |key,value|
                    value.each do |slots|
                        slots.isEmpty = false if slots.id==slot.id && slots.isEmpty
                    end
                end
                break
            end
            break
        end
        vehicles << vehicle
        "Tic_#{vehicle.registration_no}_#{vehicle.ticket.floor_no}_#{vehicle.ticket.slot_no}"
    end

    def unpark_vehicle(ticket)
        floor_no = ticket.split("_")[2]
        slot_no = ticket.split("_")[3]
        floor = floor_slot_mp.select{|key,_| key.id == floor_no.to_i}
        @floor_slot_mp.each do |key,value|
            if key.id == floor_no.to_i
                value.each do |slots|
                    slots.isEmpty = true if slots.id == slot_no.to_i
                end
            end
        end
    end
end