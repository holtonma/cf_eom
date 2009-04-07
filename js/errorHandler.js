function errorHandler(message)
{
	$('disabledZone').style.visibility = 'hidden';
    if (typeof message == "object" && message.name == "Error" && message.description)
    {
        alert("Error: " + message.description);
    }
    else
    {
        alert(message);
    }
};
