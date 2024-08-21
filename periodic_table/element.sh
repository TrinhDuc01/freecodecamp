#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  else
    ELEMENT_BY_ATOMIC_NUMBER=$($PSQL "select atomic_number,symbol,name,type,atomic_mass,melting_point_celsius,boiling_point_celsius from elements inner join properties using(atomic_number) inner join types using(type_id) where elements.symbol='$1' or elements.name='$1'")
    if [[ -z $ELEMENT_BY_ATOMIC_NUMBER ]]
    then
      re='^[0-9]+$'
      if [[ $1 =~ $re ]] ; then
        ELEMENT_BY_SYMBOL=$($PSQL "select atomic_number,symbol,name,type,atomic_mass,melting_point_celsius,boiling_point_celsius from elements inner join properties using(atomic_number) inner join types using(type_id) where atomic_number=$1")
        IFS='|' read -r ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING BOILING var2 <<< "$ELEMENT_BY_SYMBOL"
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a nonmetal, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
        else
        echo "I could not find that element in the database."
      fi
    else
      IFS='|' read -r ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING BOILING var2 <<< "$ELEMENT_BY_ATOMIC_NUMBER"
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a nonmetal, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    fi
fi