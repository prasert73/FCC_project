#! /bin/bash
#ADD comment1
#ADD comment2
#ADD comment3
PSQL="psql --username=freecodecamp --dbname=users -t --no-align -c"
RANDOM_NUMBER=$($PSQL "SELECT FLOOR(random()*1000)")

echo Enter your username:
read USER_NAME

EX_USER=$($PSQL "SELECT * FROM users WHERE username='$USER_NAME'")
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USER_NAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USER_NAME'")

if [[ -z $EX_USER ]]
then
  echo Welcome, $USER_NAME! It looks like this is your first time here.
else
  echo Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

echo Guess the secret number between 1 and 1000:
read GUESS_NUMBER
GUESS_COUNT=0
while [[ $GUESS_NUMBER != $RANDOM_NUMBER ]]
do
   if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then 
    echo That is not an integer, guess again:
  else
    if [[ $GUESS_NUMBER > $RANDOM_NUMBER ]]
    then
      GUESS_COUNT=$((GUESS_COUNT+1))
      echo It\'s lower than that, guess again:
    fi
    if [[ $GUESS_NUMBER < $RANDOM_NUMBER ]]
    then
      GUESS_COUNT=$((GUESS_COUNT+1))  
      echo It\'s higher than that, guess again:
    fi
  fi
read GUESS_NUMBER
done
GUESS_COUNT=$((GUESS_COUNT+1))                                                                             
if [[ -z $EX_USER ]]
then
  GAMES_COUNT=1
  INSERT_DATA=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USER_NAME',$GAMES_COUNT,$GUESS_COUNT)")
else
  if [[ $BEST_GAME > $GUESS_COUNT ]]
  then
    ALTER_BEST_GAME=$($PSQL "UPDATE users SET best_game=$GUESS_COUNT WHERE username='$USER_NAME'")
  fi
  GAMES_COUNT=$(($GAMES_PLAYED+1))
  ALTER_GAME_PLAYED=$($PSQL "UPDATE users SET games_played=$GAMES_COUNT WHERE username='$USER_NAME'")
fi

echo "You guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"