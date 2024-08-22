#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDOM_NUMBER=$(( ( RANDOM % 1000 )  + 1 ))
COUNT_GUESS=1
MAIN(){
  echo 'Enter your username:'
  read USERNAME;
  USER_ID="$($PSQL "select user_id from users where name='$USERNAME'")";
  if [[ -z $USER_ID ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    ADD_USER="$($PSQL "insert into users(name) values('$USERNAME')")"
  else
    GAME_PLAYED="$($PSQL "select count(*) from games where user_id = $USER_ID")"
    BEST_GAME="$($PSQL "select min(number_of_guesses) from games where user_id = $USER_ID")"
    echo "Welcome back, $USERNAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
  echo "Guess the secret number between 1 and 1000:"
  echo $RANDOM_NUMBER
  GUESS
  USER_ID_LAST="$($PSQL "select user_id from users where name='$USERNAME'")";
  ADD_LOG_GAME="$($PSQL "insert into games(user_id,number_of_guesses,secret_number) values($USER_ID_LAST,$COUNT_GUESS,$RANDOM_NUMBER)")"
}

GUESS(){
  if [[ $1 ]]
  then
    echo $1
  fi
  read GUESS_NUMBER
  re='^[0-9]+$'
  if ! [[ $GUESS_NUMBER =~ $re ]] ; then
    GUESS "That is not an integer, guess again:"
    else
      if [[ $GUESS_NUMBER == $RANDOM_NUMBER ]]
      then
        echo "You guessed it in $COUNT_GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
      elif [[ $GUESS_NUMBER -gt $RANDOM_NUMBER ]]
      then
        ((COUNT_GUESS++))
        GUESS "It's lower than that, guess again:"
      else
        ((COUNT_GUESS++))
        GUESS "It's higher than that, guess again:"
      fi
  fi
}

MAIN