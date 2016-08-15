#!/bin/bash
<<<<<<< HEAD
<<<<<<< HEAD
=======
#curl http://myip.dnsomatic.com
#echo ""
#hostname -i

THIS=`curl http://myip.dnsomatic.com 2> /dev/null`
echo "$THIS"
echo "$( hostname -i )"

=======
<<<<<<< HEAD
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
curl http://myip.dnsomatic.com
echo ""
hostname -i

=======
THIS=`curl http://myip.dnsomatic.com 2> /dev/null`
echo "Public IP: $THIS"
echo "Local IP: $( hostname -i )"
>>>>>>> c3443e9cbb3798c5dc81c3655915d4a4ab7a958b
<<<<<<< HEAD
=======
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8

exit 0


