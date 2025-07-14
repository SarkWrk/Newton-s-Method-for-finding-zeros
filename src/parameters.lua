local parameters = {}

function parameters.func(x)
    -- Your function as represented in lua code here
    return -x^3 - x/10 + math.exp(x)
end

function parameters.derivative(x)
    -- Your derivative as represented in lua code here
    return -3*x^2 - 1/10 + math.exp(x)
end

-- How many decimal places that the zero should be accurate to
parameters.decimal_accuracy = 6

-- Initial x value (x0)
parameters.init_x = 1

-- How many iterations to run before stopping
parameters.max_iterations = 10

return parameters