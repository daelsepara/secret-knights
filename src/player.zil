<CONSTANT DATA-BANKS "These facts about knights and medieval England will help you complete your mission:||1) Knights preferred to fight on horseback rather than on foot. They used swords, spears, lances, and many kinds of metal and wooden clubs.||2) Knights often fought mock battles called tournaments for sport. They used long lances to try and knock their opponents off their horses.||3) Knights wore metal armor for protection in tournaments and battle. A suit of armor was called a harness.||4) Two kinds of bow and arrow were used in battles in the 1300s. The crossbow was very powerful but slow. The string had to be pulled by a complicated little machine. The longbow was much faster but tricky to use. The longbow was a new weapon, and only the English knew how to use it.||5) Knights never used bow and arrow. They preferred their swords and looked down on the archers who accompanied them in battle.||6) Though gunpowder was used in Europe as early as 1300, it was not until the 1400s that guns were safe enough or powerful enough to be important in fighting.||7) In the Middle Ages, criminals could find sanctuary in churches and cathedrals. It was forbidden to pursue them there.||8) Young men learning to become craftsmen or tradesmen were called apprentices. Apprentice knights were called squires. A squire could only become a knight in a ceremony performed by a king or prince.||9) Knights had a code of honor called chivalry. A knight swore to be brave, generous, and loyal to his lord, and to protect and honor women.||10) People accused of being witches or sorcerers in the Middle Ages were often tied up with ropes and thrown into a pond. If the person floated, he or she was supposed to be guilty. If they sank, they were often burned at the stake.||11) King Edward III ruled England from 1327 to 1377. One of his most famous victories was the battle of Crecy, fought in northern France in 1346.||12] Edward III's son Edward, called the Black Prince because of the color of the armor he wore at Crecy, never became king, because he died before his father did. He married Lady Joan of Kent in 1361. Their son Richard became king in 1377.||13) Each knight wore a family design on his shield, clothes, and armor to identify him in battle. These heraldic designs were passed down from one generation to another in noble families.||14) The kings and princes of England wore a heraldic design, or crest, of three gold leopards on a red background. The kings of France wore a crest of lily flowers.||15) The famous King Arthur may not have been a king at all. We don't even know if that was his real name. All that is really known about him is that he led one of the native tribes of Britons against the invading tribes of Angles and Saxons in the fifth century A.D.||16) Centuries after the real Arthur died, stories about him were told and retold. Each time the story was retold it got a little better, until it became the elaborate legend we hear about today. The stories of the search for the Holy Grail and the Knights of the Round Table, for example, were invented in the twelfth century, seven hundred years after Arthur died.||17) The Black Death was one name for a terrible plague, or disease, that killed almost one third of the people in Europe in the 1340s. It was spread by rats and fleas, though nobody knew that at the time.||18) The Black Death arrived in England in late 1348. It disappeared in winter, because the cold kept the fleas from spreading it, but it swept the country in the warm months of 1349.||19) Medieval towns were usually surrounded by high walls for protection against attack. An attack on a town was called an assault or siege. Armies besieging a town sometimes used giant catapults to throw rocks against the walls.||20) The English had a castle in the town of Windsor from the late 1000s on. Winchester, about forty miles from Windsor, was the capital of England during the Saxon times and was still a very important city in the 1300s">

<ROUTINE DATA-BANK ()
    <EMPHASIZE "DATA BANK">
    <CRLF>
    <TELL DATA-BANKS>
    <TELL ,PERIOD-CR>
    <EMPHASIZE "DATA BANK COMPLETED">>

<CONSTANT DATA-FILES
    <LTABLE
        "This type of harness is not meant for a horse."
        "You can hide in either, but only in one can they go-seek."
        "How well should a knight know how to shoot arrows?"
        "What arrived in England in 1348?"
        "To everything there is a season, including disease."
        "Have you seen this boy before?"
        "Will you want to meet the visitor that arrived from overseas in 1348?"
        "You can trust what your friend Nigel tells you."
        "How does one become a knight?"
        "Is there something fishy about trial by water?"
        "How much could the people of King Edward's time know about King Arthur?"
        "Golden leopards appear in the signs of certain kings."
        "Flattery may get you somewhere when a king asks for a song about a king."
        "The year 90 A.D. is part of which century?"
        "A knight should try to live up to the code of chivalry."
        "When will they really get a bang out of cannons?"
        "A knight must live by the code of chivalry."
    >>

<CONSTANT DATA-FILES-INDEX
    <LTABLE
        STORY008
        STORY012
        STORY014
        STORY019
        STORY029
        STORY041
        STORY044
        STORY056
        STORY058
        STORY064
        STORY073
        STORY074
        STORY079
        STORY080
        STORY086
        STORY096
        STORY112
    >>

<ROUTINE DATA-FILE (STORY "AUX" ITEMS)
    <COND (<NOT .STORY> <RFALSE>)>
    <SET ITEMS <GET DATA-FILES-INDEX 0>>
    <COND (<G? .ITEMS 0>
        <DO (I 1 .ITEMS)
            <COND (<EQUAL? .STORY <GET DATA-FILES-INDEX .I>>
                <CRLF>
                <EMPHASIZE <GET DATA-FILES .I>>
                <RTRUE>
            )>
        >
    )>
    <RFALSE>>