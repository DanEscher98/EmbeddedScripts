#!/usr/bin/bash

# Global variables are initialized by Env Vars.
# I'm setting a default value with "${VAR_NAME:-"DEFAULT_VALUE"}"
_USER_NAME="${USER_NAME:-"$USER"}"
_USER_AGE="${USER_AGE:-""}"


complement_name(){
  local name="$1"
  echo "Wow, ${name}, you have a beautiful name!"
}


complement_age(){
  local name="$1"
  local age="$2"
  if [[ "$age" -gt "30" ]]; then
    echo "Seriously ${name}? I thought you were $((age-7))"
  else
    echo "Such a weird age, are you sure it's a number?"
  fi
}


main(){
  # The only function that is not "pure"
  # This function is tightly coupled to the script
  complement_name "$_USER_NAME"
  complement_age "$_USER_NAME" "$_USER_AGE"
}


# Invokes the main function
main

if [[ "$USER_NAME" = "Julia" || "$USER_NAME" = "Willy" ]] \
   && [[ "$USER_AGE" -gt "30" ]]; then
  echo "Easy to read right?"
fi


_USER_NAME="${USER_NAME:-"$USER"}"


# Good - decoupled
decoupled_username(){
  local name="$1"
  echo "name = ${name}" 
}

# Usage
coupled_username  
decoupled_username "$_USER_NAME"

