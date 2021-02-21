  1 #!/bin/bash
  2
  3 # LXC Maschinen create und start
  4
  5 # ausgabe der existierenden Container
  6 sudo lxc-ls --fancy
  7
  8 # Schleife die alle Uebergebene Parameter nach einander abarbeitet
  9 for i
 10 do
 11 # Prufung ob ein Container mit dem Namen schon exisitiert
 12 if sudo lxc-info --name ${i} > /dev/null 2>&1
 13 then
 14         # das Container exisitert
 15         echo Container ${i} exist.
 16         # Prufue ob er running oder stopped wenn ja starte
 17         if sudo lxc-info --name ${i} | grep -i 'stopped' > /dev/null 2>&1
 18         then
 19                 echo Container ${i} is stopped, start the Container.
 20                 sudo lxc-start --name ${i}
 21         else
 22                 echo Container ${i} already running.
 23         fi
 24 else
 25         # Container existiert nicht muss erstelt ung gestartet werden
 26         echo Container ${i} create and start.
 27         sudo lxc-create --name ${i} --template ubuntu > /dev/null 2>&1
 28         sudo lxc-start --name ${i}
 29 fi
 30 done
 31
 32 # ware 7 Sekunden damit die COntainer IP-Adressen bekommen.
 33 sleep 7
 34 sudo lxc-ls --fancy
~                         
