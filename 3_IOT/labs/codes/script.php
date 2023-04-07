<?php
    system("gpio -g mode 4 out");   # GPIO04 – broche 7 en OUT    
    if($_POST['executer'] == 'ON')  # test à ON  - si pas ON c’est forcement OFF
    {
        system("gpio -g write 4 1");  #  GPIO04 – broche 7 mise à 1 
    }
    else
    {
        system("gpio -g write 4 0"); #  GPIO04 – broche 7 mise à 0
    }
    header('Location: index.php');   # après chaque clic, afficher la page index.php
?>