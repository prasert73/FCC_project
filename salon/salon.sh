#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
SALON_SERVICES=$($PSQL "SELECT service_id, name FROM services")

MAIN_MENU(){
if [[ $1 ]] 
then
  echo -e "\n$1"
fi
echo -e "\nOur Salon Shop Services"
echo "$SALON_SERVICES" | while read SERVICE_ID NAME
do 
  if [[ $SERVICE_ID =~ ^[0-9]+$ ]]
  then 
    echo "$SERVICE_ID) $NAME" | sed 's/ | / /g'
  fi
done
read SERVICE_ID_SELECTED
}

GET_CUSTOMER_INFO(){
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
echo -e "\nPlease enter your phone number"
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

if [[ -z $CUSTOMER_NAME ]]
then
  echo -e "\nWe can't find your phone number. Please enter your name"
  read CUSTOMER_NAME
  ADD_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
fi
CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone = '$CUSTOMER_PHONE'")
echo -e "\nplease enter service time"
read SERVICE_TIME
ADD_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
if [[ $ADD_NEW_APPOINTMENT = "INSERT 0 1" ]]
then
  MOD_SERVICE_NAME=$(echo $SERVICE_NAME | sed 's/^ *//')

  echo -e "\nI have put you down for a $MOD_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
fi
}

MAIN_MENU
case $SERVICE_ID_SELECTED in
1) GET_CUSTOMER_INFO ;;
2) GET_CUSTOMER_INFO ;;
3) GET_CUSTOMER_INFO ;;
*) MAIN_MENU "Please pick service again" ;;
esac

