#second commit
#third commit
#fourth commit
#fifth commit
PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [[ $1 ]]
then
  if [[ $1 =~ [0-9]+ ]]
  then SELECTED_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1" | sed -r 's/^ +//')
  else SELECTED_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1'" | sed -r 's/^ +//')
  fi
  if [[ -z $SELECTED_ATOMIC_NUMBER ]]
  then 
    echo I could not find that element in the database.
  else 
  NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$SELECTED_ATOMIC_NUMBER" | sed -r 's/^ +//')
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$SELECTED_ATOMIC_NUMBER" | sed -r 's/^ +//')
  TYPE=$($PSQL "SELECT type FROM properties INNER JOIN types USING(type_id) WHERE atomic_number=$SELECTED_ATOMIC_NUMBER" | sed -r 's/^ +//')
  ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$SELECTED_ATOMIC_NUMBER" | sed -r 's/^ +//')
  MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$SELECTED_ATOMIC_NUMBER" | sed -r 's/^ +//')
  BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$SELECTED_ATOMIC_NUMBER" | sed -r 's/^ +//')
  echo The element with atomic number $SELECTED_ATOMIC_NUMBER is $NAME \($SYMBOL\). It\'s a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius.
  fi
else 
echo Please provide an element as an argument.
fi