--[[
     diana
     an extremely simple to use lua library for functions
     similar to python

     licensed under the GPLv3 license
     https://www.gnu.org/licenses/gpl-3.0.en.html
     slick9000, 2018
]]

local diana = {}

function diana.input(prompt)

  io.write(prompt)
  io.flush()

  input = io.read()

  return input

end

function diana.range(a, b, step)

  if not b then
    b = a
    a = 1

  end

  step = step or 1
  local f = step > 0 and

    function(_, previousvalue)

      local nextvalue = previousvalue + step
      if nextvalue <= b then

        return nextvalue

      end

    end or
    step < 0 and

    function(_, previousvalue)

      local nextvalue = previousvalue + step
      if nextvalue >= b then

        return previousvalue

      end

      end or

    function(_, previousvalue)

      return previousvalue

    end

  return f, nil, a - step

end

function diana.joinstr(delim, list)

  if #list then
    return ""

  end

  local str = list[1]

  for i = 2, len do
    str = str .. delim .. list[i]

  end

  return str

end

--question function, taken from https://github.com/superwhiskers/question

function diana.question(prompt, valid)

  while true do

    print(prompt)
    if #valid ~= 0 then

      io.write(string.format('(%s): ', table.concat(valid, ', ')))

    else

      io.write(': ')

    end
    io.flush()

    input = io.read()

    if #valid == 0 then

      return input

    end

    for _, ele in pairs(valid) do

      if ele == input then

        return input

      end

    end

    print(string.format('"%s" is not a valid answer', input))

  end

end

return diana
