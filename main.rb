require_relative 'LinkedList'

list = Linked_List.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')
list.insert_at(2, 'boy', 'girl')
list.insert_at(4, 'TEST!')
list.insert_at(0, 'Boom!')
puts list 
list.at(10)
list.remove_at(5)


puts list