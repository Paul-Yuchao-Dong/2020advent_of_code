library(magrittr)
inputs <- rio::import("./01/input.txt")

# inputs <- c(1969, 100756)

total_fuel <- inputs %>% 
  {. %/% 3 - 2} %>% 
  floor()

previous_mass <- total_fuel # initial load

while (any(previous_mass>2)) {
  next_load <- previous_mass %>% 
    {. %/% 3 - 2}
  
  next_load[next_load<0] <- 0
  
  total_fuel <- cbind(total_fuel, next_load)
  
  previous_mass <- next_load
}

sum(total_fuel)
