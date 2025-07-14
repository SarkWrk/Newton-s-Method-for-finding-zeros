-- Debugger
local success, failure = pcall(
    function()
        require("lldebugger").start()
    end
)

if not success then
    print("Debugger failed to start: " .. failure)
end

package.path = "src/?.lua;" .. package.path

-- Start parameters
local parameters = require "parameters"

local original_x = parameters.init_x
local new_x = parameters.init_x

local approx = function (max_iter)
    -- Ignore the error if there's an error under this specific line
    local max_places = math.floor(math.log(max_iter, 10) + 1)

    for i = 1, max_iter do
        original_x = new_x

        new_x = original_x - (parameters["func"](original_x) / parameters["derivative"](original_x))

        -- Fancy formatting because it looks nicer
        io.write(string.format("x%0" .. max_places .. "i-> x%." .. max_places ..
            "i : %+." .. parameters.decimal_accuracy .. "f\n", i-1, i, new_x))

        if math.floor(new_x*10^parameters.decimal_accuracy) ==
            math.floor(original_x*10^parameters.decimal_accuracy) then
            break
        end
    end

    io.write(string.format("Found potential zero at %+." .. parameters.decimal_accuracy .. "f\n", new_x))
end

-- Argument is how many times to find a new x, if previous x is equal to new x, it will break out of the loop
approx(parameters.max_iterations)