require 'sinatra'

@@secret_number = rand(101)
@@count = 5

def check_guess(guess)
  @@count -= 1
  if @@count == 0
    @@secret_number = rand(101)
    @@count = 5
  end
  return "correct! You are awesome" if correct? guess
  return "way too high, keep trying!" if way_too_high? guess
  return "too high, keep trying!" if too_high? guess
  return "way too low yo!" if way_too_low? guess
  return "too low yo!" if too_low? guess
end

def correct?(guess)
  guess == @@secret_number
end

def too_high?(guess)
  guess > @@secret_number
end

def way_too_high?(guess)
  guess > @@secret_number + 5
end

def too_low?(guess)
  guess < @@secret_number 
end

def way_too_low?(guess)
  guess < @@secret_number - 5
end



get '/' do
  guess = params["guess"].to_i
  cheat = params["cheat"]
  message = check_guess(guess)
  erb :index, :locals => {:number => @@secret_number, :message => message, :cheat => cheat}
end
