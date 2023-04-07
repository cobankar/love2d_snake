dll = require("../utilities/doublylinkedlist")

list = dll.new()
list:print()
list:insertHead(3)
list:insertHead({x = 3, y =3})
list:insertTail(9)
list:print()
for v in list:getIter() do
  print(v)
end
list:deleteHead()
list:print()
list:deleteTail()
list:print()
print(list:isEmpty())


Snake = require("../snake")

snake = Snake.new()
snake:print()
snake:move()
snake:print()
for v in snake:getIter() do
  print(v)
end