<CONSTANT INSTRUCTIONS-HEADER "|ATTENTION TIME TRAVELLER!|">
<CONSTANT INSTRUCTIONS-TEXT "Instructions for this gamebook has not been written yet.">

<ROUTINE INSTRUCTIONS ()
    <HLIGHT ,H-BOLD>
    <TELL INSTRUCTIONS-HEADER>
    <HLIGHT 0>
    <CRLF>
    <TELL INSTRUCTIONS-TEXT>
    <CRLF>>

<CONSTANT HELP-TEXT "C - Display player information (skills, items, codewords)|G - Display glossary of skills|Q - quit the game">

<ROUTINE DISPLAY-HELP ()
    <CRLF>
    <HLIGHT ,H-BOLD>
    <TELL "Additional Command Keys:">
    <HLIGHT 0>
    <CRLF><CRLF>
    <TELL HELP-TEXT>
    <CRLF>>