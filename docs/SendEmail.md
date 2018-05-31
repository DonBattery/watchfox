### SendEmail

creats an **allert_email** file and sends it with [msmtp](http://msmtp.sourceforge.net/) to the email address
provided in **config.json**. Using the service credentials provided in **mytokens.env**

this small script accepts 6 parameters:

$1 recipiant email addres\
$2 service name\
$3 service URL\
$4 Server status\
$5 APP status\
$6 Database status\
