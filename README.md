# diana
library of python functions implemented in lua!


## usage
download diana.lua and import it to where your application is

## functions
### **input function**
```lua
local d = require('diana')

out = d.input("Input a number\n: ")

print(out)
```


Output: 

Input a number

: 2

2

<br/>

### **range function**
#### example without increment value
```lua
local d = require('diana')

for i in d.range(1, 5) do  -- 1 is initial value, 5 is final value

  print(i)
  
end
```

Output:

1

2

3

4

5

#### example with increment value
```lua
local d = require('diana')

for i in d.range(2, 20, 4) do -- 2 is initial value, 20 is final value, 4 is increment/step value

  print(i)
  
end
```

Output:

2

6

10

14

18

<br/>

### **joinstr function** (as well as input function)
```lua
local d = require('diana')

first_name = d.input("Enter first name\n: ")

last_name = d.input("Enter last name\n: ")

full_name = d.joinstr({first_name, last_name})

print(full_name)
```


Output:

Enter first name

: Terry

Enter last name

: Red

Terry Red

<br/>

### **splitstr function**
#### example without separator
```lua
local d = require('diana')

ans = d.splitstr("example of split string")

for _, s in ipairs(ans) do -- to display nested tables you need nested loops
  
  print(s)

end
```

Output:

example

of

split

string

#### example with separator
```lua
local d = require('diana')

ans = d.splitstr("example,of,split,string", ",") -- split by comma

for _, s in ipairs(ans) do -- to display nested tables you need nested loops
  
  print(s)

end
```

Output:

example

 of

 split

 string

<br/>

### **question function** (demonstrated by simple bank program)
this bank program also demonstrates how **all** of the functions can be utilized from diana.
```lua
local d = require('diana')

local balance = 10

local option = d.question("1 - Check Balance\n2 - Withdraw Cash\n3 - Deposit Cash\n4 - Exit", {"1", "2", "3", "4"})

if option == "1" then

  print(balance)

end

if option == "2" then

  withdrawal = d.input("input amount to deduct from account\n: ")

  balance = balance - withdrawal

  print(d.joinstr({"new balance is:",balance}))
  
end

if option == "3" then

  deposit = d.input("input amount to deposit into account\n: ")

  balance = balance + deposit

  print(d.joinstr({"new balance is:",balance}))
  
end

if option == "4" then

  print("thank you for usage our service!")
  
end
```

Output:

1 - Check Balance

2 - Withdraw Cash

3 - Deposit Cash

4 - Exit

<br/>

**(if option is 1)**

10

**(if option is 2)**

input amount to deduct from account

: 7

new balance is: 3


**(if option is 3)**

input amount to deposit into account

: 9

new balance is: 19

**(if option is 4)**

thank you for using our service!
