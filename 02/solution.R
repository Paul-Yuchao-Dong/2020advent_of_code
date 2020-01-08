
getter <- function(v, p, offset){
  v[v[p+offset]+1]
}

setter <- function(v, p, offset, value){
  position <- v[p+offset]+1
  call <- rlang::expr(inputs[!!position] <- !!value)
  rlang::eval_bare(call, env = parent.frame())
}


inputs <- rio::import("./02/input.txt")
#replace position 1 with the value 12 and replace position 2 with the value 2
inputs[2] <- 12; inputs[3] <- 2

# inputs <- c(1,9,10,3,2,3,11,0,99,30,40,50)
inputs <- as.numeric(inputs)
pointer <- 1
while(pointer <= length(inputs) && inputs[[pointer]] != 99) {
  
  op_code <- inputs[pointer]
  switch (as.character(op_code),
    "1" = {setter(inputs,pointer,3,  getter(inputs,pointer,1) + getter(inputs,pointer,2)) },
    "2" = {setter(inputs,pointer,3,  getter(inputs,pointer,1) * getter(inputs,pointer,2))}
  )
  
  pointer <- pointer + 4
  
}

inputs
