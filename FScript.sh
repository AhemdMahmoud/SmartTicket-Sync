echo "Please enter your incident number"
read incident 
status=$(awk -v inc="$incident" '$1==inc {print $2}' ticket_status.txt )

if [ -z "$status" ]; then 
	echo "Incident not found."
	exit 1
fi
event=$(grep "^$incident" events_tickets.txt | awk '{print $2}')
#event_status= $(grep "^$event" events_status.txt | awk '{print $2}'
#
if [ -z "$event" ]; then
        echo "Event ID not found for this incident."
        exit 1
fi

if [ "$status" == "closed" ]; then 
	event_status=$(grep "^$event" events_status.txt | awk '{print $2}')
#echo "$event closed" >> events_status.txt
	 if [ -z "$event_status" ]; then
	       echo "$event closed" >> ClosedEvent.txt
               echo " Event : $event closed Successfully🫡😍"	 
	elif [ "$event_status" == "opened" ]; then 

		echo "$event closed" >> ClosedEvent.txt
	        echo " Event : $event closed Successfully🫡😍"
	else 
		echo "Event is Already Closed"	
	fi
elif [ "$status" == "opened" ]; then
	echo "Event: $event is still open."
else
	echo "Unknown status."
fi 	
