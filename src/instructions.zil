<CONSTANT INSTRUCTIONS-HEADER "ATTENTION TIME TRAVELER!">
<CONSTANT INSTRUCTIONS-TEXT "This book is your time machine. In a moment you will receive a mission, a special task that will take you to another time period. As you face the dangers of history, the Time Machine often will give you options to go or what to do.||This E-Adventure also contains a Data Bank to tell you about the age you are going to visit. This can be accessed by pressing 'D'. You can use this Data Bank to travel more safely through time. Or you can take your chances without reading it. It is up to you to decide.||A Data File is also available. It contains hints to hep you if you are not sure what choice to make. Press 'F' to access this Data File.||To complete your mission as quickly as possible you may wish to use the Data Bank and the Data File together.||There is one correct end to this Time Machine mission. You must reach it or risk being stranded in time!">

<CONSTANT TIME-TRAVEL-HEADER "THE FOUR RULES OF TIME TRAVEL">
<CONSTANT TIME-TRAVEL-TEXT "As you begin your mission, you must observe the following rules. Time Travelers who do not follow these rules risk being stranded in time.||1. You must not kill any person or animal||2. You must not try to change history. Do not leave anything from the future in the past.||3. You must not take anybody when you jump in time. Avoid disappearing in a way that scares people or makes them suspicious.||4. You must follow instructions given to you by the Time Machine.">
<CONSTANT MISSION-HEADER "YOUR MISSION||Your mission is to become a knight, and then find out how the most famous order, or group, of English knights got its name.">
<CONSTANT MISSION-TEXT "For six hundred years, the highest honor in England has been to be made a knight of the Order of the Garter. King Edward III began this order sometime in the 1340s. Members wear a blue garter of cloth around their sleeves, on which is written \"Honi soit qui mal y pense.\" This is the motto of the Order of the Garter.||Why did the best knights in England choose a garter as their symbol -- and what does the motto mean? The secret of the knights is hidden back in time. You must travel back six centuries to find it, but to do so you will first have to become a knight yourself!">

<CONSTANT EQUIPMENT-HEADER "EQUIPMENT">
<CONSTANT EQUIPMENT-TEXT "For your equipment, you will take with you a simple peasant's outfit. You will be wearing it when you arrive in the age of knights.">

<ROUTINE INSTRUCTIONS ()
    <EMPHASIZE INSTRUCTIONS-HEADER>
    <CRLF>
    <TELL INSTRUCTIONS-TEXT>
    <CRLF>
    <EMPHASIZE MISSION-HEADER>
    <CRLF>
    <TELL MISSION-TEXT>
    <CRLF>
    <EMPHASIZE EQUIPMENT-HEADER>
    <CRLF>    
    <TELL EQUIPMENT-TEXT>
    <CRLF>
    <REPEAT ()
        <CRLF>
        <TELL "Begin your mission now?">
        <COND (<YES?>
            <EMPHASIZE "TIME TRAVEL ACTIVATED">
            <RETURN>
        )(ELSE
            <DATA-BANK>
        )>
    >>

<CONSTANT HELP-TEXT "A - About the contributors|D - Display Data Banks|F - Display data files|Q - quit the game">

<ROUTINE DISPLAY-HELP ()
    <CRLF>
    <HLIGHT ,H-BOLD>
    <TELL "Additional Command Keys:">
    <HLIGHT 0>
    <CRLF><CRLF>
    <TELL HELP-TEXT>
    <CRLF>>

<CONSTANT CONTRIBUTORS-HEADER "About the Contributors">
<CONSTANT CONTRIBUTORS-TEXT "JIM GASPERINI reviews interactive computer fiction for \"Electronic Fun\", and published the history of a medieval french artisans guild in \"Museum\". He has been a videotape editor, a busker, a traveling book salesman, a literary agent and made his operatic debut in the 1983 Metropolitan Operas production of \"Don Carlo\" as Arquebusier (spear-carrier). He resides in New York.||RICHARD HESCOX is an illustrator whose paperback book covers and illustrations have had world-wide distribution. His work has covered such diverse fields as magazine illustration, advertising, record album covers and production designs for films including \"The Howling\" and \"A Trip To Tomorrow.\" He has painted movie posters for \"Swamp Thing\", \"E.T.\", \"The Dark Crystal\" and other features. Some
of his fantasy work has been published in a portfolio entitled \"A Fatal Beauty.\" He resides in Hollywood, California">

<ROUTINE DISPLAY-CONTRIBUTORS ()
    <EMPHASIZE CONTRIBUTORS-HEADER>
    <CRLF>
    <TELL CONTRIBUTORS-TEXT>
    <TELL ,PERIOD-CR>>
