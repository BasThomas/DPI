# Product A: beargumenteerde keuze (J)MS-implementatie

Om de MS-implementatie te gaan verwezelijken ben ik van plan een proof-of-concept hiervan op te zetten in `Swift`.

Om dit te realiseren in `Swift`, is in principe geen framework vereist. Omdat dit wel handig zou zijn - maar er nog niet is - zal ik __zelf__ een framework gaan ontwikkelen wat andere developers vervolgens kunnen gebruiken.

Door gebruik te maken van queuing en [`Grand Central Dispatch`](https://github.com/apple/swift-corelibs-libdispatch) zal het hele framework multithreaded zijn, waarbij alle intensieve taken op de achtergrond worden uitgevoerd.

Ook wil ik daarbij na gaan denken hoe `Swift` Concurrency kan implementeren - of in ieder geval, hoe dit er voor de eindgebruiker (developer) qua API uit zou kunnen zien (zie [hier](https://github.com/apple/swift-evolution#out-of-scope).). Dit zal dan echter wel “gewoon” met libdispatch gerealiseerd worden.

Het is de bedoeling een compact framework te gaan ontwikkelen wat `Queuing` en `Topics` zal ondersteunen. Oftewel: messages kunnen worden verstuurd en worden opgepikt door de ontvanger met zowel queuing alsook topics, waarmee (vanzelfsprekend) specifieke berichten onderschept kunnen worden.

In de context van het project, de universele applicatie waarbij 3D printers op afstand bediend kunnen worden en hier informatie kan worden opgevraagd, kun je wat `topics` betreft denken aan `filament notifications`, (specifieke) `progress notifications`, `errors` en meer.
