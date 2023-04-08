function findIndex(t, value)
  for i, v in ipairs(t) do
    if v.x == value.x and v.y == value.y then
      return i
    end
  end
end
