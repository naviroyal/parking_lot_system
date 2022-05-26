require_relative 'parking_lot'
require_relative 'slot'
require_relative 'floor'
require_relative 'vehicle'

class Main
    num_of_floors = 2
    parking_lot = ParkingLot.new(num_of_floors);

    (1..num_of_floors).each do |floor_num|
        num_of_slots = 10
        floor = Floor.new(floor_num,num_of_slots)
        (1..num_of_slots).each do |slot|
            floor.slots << Slot.new(true,slot)
        end
        parking_lot.floor_slot_mp[floor] = floor.slots
    end

    puts "Enter the Vehicle you want to park\n Registration_No \n vehicle type \n colour"
    vehicle1 = Vehicle.new(gets.chomp(),gets.chomp(),gets.chomp())
    puts "Following are the spaces available in parking"
    free_slots = parking_lot.get_free_slots(vehicle1.type)

    if(!free_slots.size)
        puts "Sorry No Space Available"
    else
        free_slots.each do |key,value|
            print "Floor #{key.id} -> "
            value.each do |slot|
                print "(Slot #{slot.id})"
            end
            puts ""
        end
       puts parking_lot.park_vehicle(vehicle1)
    end

    free_slots = parking_lot.get_free_slots(vehicle1.type)
    free_slots.each do |key,value|
        print "Floor #{key.id} -> "
        value.each do |slot|
            print "(Slot #{slot.id})"
        end
        puts ""
    end

end