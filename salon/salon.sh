#! /bin/bash
PSQL='psql --username=freecodecamp --dbname=salon -t --no-align -c'
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"
MAIN_MENU(){
  if [[ $1 ]]
  then
    echo $1
  fi
  # get all services
  SERVICES=$($PSQL "select * from services")
  echo "$(echo "$SERVICES" | sed 's/|/) /g')"
  # get service id request
  read SERVICE_ID_SELECTED
  # get service name
  SERVICE=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED");
  if [[ -z $SERVICE ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
    else
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      # get customer name
      CHECK_CUSTOMER=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")
      if [[ -z $CHECK_CUSTOMER ]]
      then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        # insert new customer
        CUSTOMER=$($PSQL "insert into customers(name,phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
        
      fi
      # get customer name
      CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")
      CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
      echo -e "\nWhat time would you like your color, $CUSTOMER_NAME?"
      read SERVICE_TIME
      APPOINTMENT=$($PSQL "insert into appointments(customer_id,service_id,time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
      echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU