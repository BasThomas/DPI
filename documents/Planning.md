# Planning

Voor het vak DPI wil ik graag `JMS` 'nabootsen' in `Swift`, de programmeertaal van Apple die gebruikt wordt voor zijn platformen.

De casus die ik daarbij aan wil houden, is hieronder beschreven:

We (Thijs Koppen en ik) gaan twee apps ontwikkelen om een 3D printer op afstand te kunnen besturen en informatie op afstand op te kunnen vragen; een voor `Android`, een voor `iOS` / `watchOS`.

Om dit zo goed mogelijk en gebruiksvriendelijk mogelijk te realiseren is het cruciaal dat de gebruiker van statusupdates op de hoogte wordt gehouden. Een prima optie hiervoor is een messaging system wat vergelijkbaar is met JMS: 

* Pushnotificaties wanneer bij een print problemen ontstaan
* Pushnotificaties wanneer een print voltooid is

Waarmee rekening gehouden wordt met:

* `Queuing` - wanneer een pushnotificatie (tijdelijk) niet verzonden kan worden)
* `Topics` - waarbij een gebruiker in kan stellen van welke notificaties hij op de hoogte gehouden wilt worden

... waarbij dit alles dus in een context terecht komt die daadwerkelijk gebruikt gaat worden en waarbij de technieken die hierboven beschreven zijn een duidelijke toevoeging zijn voor de gebruiker.

Dit alles met secuirity, performance en betrouwbaarheid als belangrijke pijlers.