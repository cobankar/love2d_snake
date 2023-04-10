local DoublyLinkedList = {}

local Node = function(v, n, p)
  return {
    value = v,
    next = n,
    prev = p,
  }
end

DoublyLinkedList.new = function()
  return {
    head = nil,
    tail = nil,

    isEmpty = function(self)
      return self.head == nil
    end,

    insertHead = function(self, value)
      local next = self.head
      local prev = nil
      local node = Node(value, next, prev)
      if self.head ~= nil then
        self.head.prev = node
      else
        self.tail = node
      end
      self.head = node
    end,

    insertTail = function(self, value)
      local next = nil
      local prev = self.tail
      local node = Node(value, next, prev)
      if self.tail ~= nil then
        self.tail.next = node
      else
        self.head = node
      end
      self.tail = node
    end,

    deleteHead = function(self)
      if not self.head then error("nothing to remove - list already empty") end
      if not self.head.next then
        self.head = nil
        self.tail = nil
      else
        self.head = self.head.next
        self.head.prev = nil
      end
    end,

    deleteTail = function(self)
      if not self.tail then error("nothing to remove - list already empty") end
      if not self.tail.prev then
        self.head = nil
        self.tail = nil
      else
        self.tail = self.tail.prev
        self.tail.next = nil
      end
    end,

    getLength = function(self)
      local node = self.head
      local count = 0
      while node do
        count = count + 1
        node = node.next
      end
      return count
    end,

    getIter = function(self)
      node = self.head
      return function()
        if node == nil then return nil end
        local value = node.value
        node = node.next
        return value
      end
    end,

    getIterNoHead = function(self)
      node = self.head
      if node == nil then return end
      node = node.next
      return function()
        if node == nil then return nil end
        local value = node.value
        node = node.next
        return value
      end
    end,

    print = function(self)
      out = "head"
      local node = self.head
      while node do
        out = out .. " <--> "
        if type(node.value) == "table" then
          for k in pairs(node.value) do
            out = out .. "{" .. k .. ":" .. node.value[k] .. "},"
          end
        else
          out = out .. node.value
        end
        node = node.next
      end
      out = out .. " <--> tail" 
      print(out)
    end,
  }
end

return DoublyLinkedList