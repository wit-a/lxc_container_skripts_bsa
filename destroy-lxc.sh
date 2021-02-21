  1 #!/bin/bash
  2
  3 # stop and destroy Container die als Paramere uebergeben wurden
  4
  5 # zeige alle existierenden Container
  6 sudo lxc-ls --fancy
  7
  8 for i
  9 do
 10 # Prufe ob der Container existiert
 11 if sudo lxc-info --name ${i} > /dev/null 2>&1
 12 then
 13         echo Container ${i} exist.
 14         if sudo lxc-info --name ${i} | grep -i 'running' > /dev/null 2>&1
 15         then
 16                 echo Container ${i} wird gestopt und zerstoert.
 17                 sudo lxc-stop --name ${i} && sudo lxc-destroy --name ${i} > /dev/null 2>&1
 18         else
 19                 echo Container ${i} ist gestopt wird zerstoert.
 20                 sudo lxc-destroy --name ${i}
 21         fi
 22 else
 23         echo "Container '${i}' don't exist."
 24 fi
 25 done
 26
 27 sudo lxc-ls --fancy
~                               
