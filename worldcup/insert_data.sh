#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "TRUNCATE TABLE games, teams;")"
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNERGOALS OPPONENTGOALS
do
  if [[ $YEAR != 'year' ]]
  then
    IDWINNER="$($PSQL "select team_id from teams where name='$WINNER'")"
    IDOPPONENT="$($PSQL "select team_id from teams where name='$OPPONENT'")"
    if [[ -z $IDWINNER ]]
    then
      ADDWINNER="$($PSQL "insert into teams(name) values('$WINNER')")"
    fi
    if [[ -z $IDOPPONENT ]]
    then
      ADDOPPONENT="$($PSQL "insert into teams(name) values('$OPPONENT')")"
    fi
  fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNERGOALS OPPONENTGOALS
do
  if [[ $YEAR != 'year' ]]
  then
    IDWINNER="$($PSQL "select team_id from teams where name='$WINNER'")"
    IDOPPONENT="$($PSQL "select team_id from teams where name='$OPPONENT'")"
    if [[ $IDWINNER > 1 ]]
    then
      ADDGAME="$($PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($YEAR,'$ROUND',$IDWINNER,$IDOPPONENT,$WINNERGOALS,$OPPONENTGOALS)")"
    fi
  fi
done