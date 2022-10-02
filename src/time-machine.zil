<INSERT-FILE "instructions">
<INSERT-FILE "player">
<INSERT-FILE "story">

<SET REDEFINE T>

<CONSTANT F <>>
<CONSTANT NONE F>

<GLOBAL CONTINUE-TO-CHOICES T>

<GLOBAL PERIOD-CR ".|">
<GLOBAL EXCLAMATION-CR "!|">

; "story properties"
<PROPDEF STORY NONE>
<PROPDEF CHOICES NONE>
<PROPDEF DESTINATIONS NONE>
<PROPDEF PRECHOICE NONE>
<PROPDEF CONTINUE NONE>
<PROPDEF DEATH F>
<PROPDEF VICTORY F>

<GLOBAL RUN-ONCE T>

<ROUTINE GAME-BOOK ("AUX" KEY CURRENT-LOC)
    <INSTRUCTIONS>
    <SETG HERE ,STARTING-POINT>
    <SETG RUN-ONCE T>
    <REPEAT ()
        <CRLF>
        <RESET-CHOICES>
        <SET CURRENT-LOC ,HERE>
        <GOTO ,HERE>
        <PRINT-PAGE>
        <CHECK-PRECHOICE>
        <COND (<EQUAL? .CURRENT-LOC ,HERE>
            <CHECK-DEATH>
            <CHECK-VICTORY>
        )>
        <COND (,CONTINUE-TO-CHOICES
            <SET KEY <PROCESS-STORY>>
            <COND (<EQUAL? .KEY !\h !\H !\?> <TELL CR "H/? - HELP" CR> <DISPLAY-HELP> <PRESS-A-KEY> <SET KEY NONE>)>
            <COND (<EQUAL? .KEY !\q !\Q> <CRLF> <TELL "Q - QUIT" CR CR> <TELL "Are you sure you want to quit the game?"> <COND(<YES?> <RETURN>)>)>
            <COND (<EQUAL? .KEY !\s !\S> <CRLF> <TELL "S - SAVE" CR CR> <TELL "Save current progress?"> <COND (<YES?> <COND (<NOT <SAVE>> <EMPHASIZE "Save failed."> <PRESS-A-KEY>)>)>)>
            <COND (<EQUAL? .KEY !\r !\R> <CRLF> <TELL "R - RESTORE" CR CR> <TELL "Restore from a previous save?"> <COND (<YES?> <COND (<NOT <RESTORE>> <EMPHASIZE "Restore failed."> <PRESS-A-KEY>)>)>)>
            <COND (<EQUAL? .KEY !\x !\X> <RETURN>)>
        )>
        <UPDATE-STATUS-LINE>
    >>

; "Story Routines - print story, process choices"
; ---------------------------------------------------------------------------------------------
<ROUTINE PRINT-PAGE ("OPT" PAGE "AUX" TEXT)
    <COND (<NOT .PAGE> <SET PAGE ,HERE>)>
    <SET TEXT <GETP .PAGE ,P?STORY>>
    <COND (.TEXT
        <CRLF>
        <TELL .TEXT>
        <CRLF>
    )>>

<ROUTINE PROCESS-CHOICES (CHOICES "AUX" DESTINATIONS KEY CHOICE)
    <SET DESTINATIONS <GETP ,HERE ,P?DESTINATIONS>>
    <TELL CR "What will you choose? ">
    <REPEAT ()
        <SET KEY <INPUT 1>>
        <COND (<AND <G=? .KEY !\1> <L=? .KEY !\9>>
            <SET CHOICE <- .KEY !\0>>
            <COND (<AND <G=? <GET .CHOICES 0> 1> <L=? .CHOICE <GET .CHOICES 0>>>
                <COND (<AND <G=? .CHOICE 1> <L=? .CHOICE <GET .DESTINATIONS 0>>>
                    <CRLF>
                    <TELL CR N .CHOICE " - ">
                    <TELL <GET .CHOICES .CHOICE>>
                    <SETG HERE <GET .DESTINATIONS .CHOICE>>
                    <CRLF>
                    <RETURN>
                )(ELSE
                    <CRLF>
                    <TELL CR "Internal Error" ,PERIOD-CR>
                    <SET KEY !\q>
                    <RETURN>
                )>
            )>
        )>
        <COND (<SPECIAL-INTERRUPT-ROUTINE .KEY> <RETURN>)>
        <COND (<EQUAL? .KEY !\q !\Q !\h !\H !\? !\r !\R !\s !\S> <CRLF> <RETURN>)>
    >
    <RETURN .KEY>>

<ROUTINE PROCESS-STORY ("AUX" COUNT CHOICES CONTINUE CURRENT-LOC CHOICE)
    <SET CHOICES <GETP ,HERE ,P?CHOICES>>
    <SET CONTINUE <GETP ,HERE ,P?CONTINUE>>
    <SET CURRENT-LOC ,HERE>
    <SETG RUN-ONCE T>
    <COND (.CHOICES
        <REPEAT ()
            <CRLF>
            <TELL "You can ">
            <SET COUNT <GET .CHOICES 0>>
            <DO (I 1 .COUNT)
                <COND (<AND <EQUAL? .I .COUNT> <G? .COUNT 1>> <TELL "or ">)>
                <HLIGHT ,H-BOLD>
                <TELL N .I ") ">
                <HLIGHT 0>
                <TELL <GET .CHOICES .I>>
                <COND (<AND <NOT <EQUAL? .COUNT 2>> <L? .I .COUNT> <TELL ", ">>)>
                <COND (<AND <EQUAL? .I 1> <EQUAL? .COUNT 2>> <TELL " ">)>
            >
            <TELL ,PERIOD-CR>
            <SET CHOICE <PROCESS-CHOICES .CHOICES>>
            <COND (.CHOICE <RETURN>)>
        >
        <COND (<EQUAL? .CURRENT-LOC ,HERE> <SETG RUN-ONCE F>)>
        <RETURN .CHOICE>
    )(.CONTINUE
        <SETG HERE .CONTINUE>
        <PRESS-A-KEY>
        <RETURN>
    )>
    <RETURN !\x>>

; ---------------------------------------------------------------------------------------------
; "Story - Event Routines (victory/death/prechoice/transition/codeword/story jump events)"
; ---------------------------------------------------------------------------------------------
<ROUTINE CHECK-DEATH ("AUX" DEATH)
    <SET DEATH <GETP ,HERE ,P?DEATH>>
    <COND (.DEATH
        <PRINT-ENDING BAD-ENDING 3>
        <SETG CONTINUE-TO-CHOICES F>
    )>>

<ROUTINE CHECK-PRECHOICE ("AUX" PRE-CHOICE)
    <SET PRE-CHOICE <GETP ,HERE ,P?PRECHOICE>>
    <COND (.PRE-CHOICE <APPLY .PRE-CHOICE>)>>

<ROUTINE CHECK-VICTORY ("AUX" VICTORY)
    <SET VICTORY <GETP ,HERE ,P?VICTORY>>
    <COND (.VICTORY
        <COND (<EQUAL? .VICTORY T>
            <PRINT-ENDING GOOD-ENDING 4>
        )(ELSE
            <PRINT-ENDING .VICTORY 6>
        )>
        <SETG CONTINUE-TO-CHOICES F>
    )>>

<ROUTINE PRINT-ENDING (MESSAGE "OPT" COLOR)
    <COND (<NOT .COLOR> <SET COLOR 1>)>
    <CRLF>
    <HLIGHT ,H-BOLD>
    <COLOR .COLOR 0>
    <TELL .MESSAGE>
    <COLOR 1 0>
    <HLIGHT 0>
    <GAMES-UP>>

<ROUTINE STORY-JUMP (STORY)
    <COND (.STORY
        <SETG HERE .STORY>
        <SETG CONTINUE-TO-CHOICES F>
        <PRESS-A-KEY>
    )>>

; "Story - Support Routines (display)"
<ROUTINE RESET-CHOICES ()
    <SETG CONTINUE-TO-CHOICES T>>

; "System/Utility/Miscellaneous routines"
; ---------------------------------------------------------------------------------------------
<ROUTINE EMPHASIZE (TEXT)
    <COND (.TEXT
        <CRLF>
        <HLIGHT ,H-BOLD>
        <TELL .TEXT>
        <HLIGHT 0>
        <CRLF>
    )>>

<ROUTINE GAMES-UP ("OPT" TEXT "AUX" W)
    <COND (.TEXT <TELL .TEXT CR>)>
    <CRLF>
    <PRINT-GAME-OVER>
    <CRLF>
    <REPEAT PROMPT ()
        <PRINTI "Would you like to RESTART or QUIT? > ">
        <REPEAT ()
            <READLINE>
            <SET W <AND <GETB ,LEXBUF 1> <GET ,LEXBUF 1>>>
            <COND (<EQUAL? .W ,W?RESTART>
                <RESTART>
            )(<EQUAL? .W ,W?QUIT>
                <QUIT-MSG>
            )(T
                <TELL CR "(Please type RESTART or QUIT) > ">
            )>
        >
    >>

<ROUTINE LINE-ERASE (ROW)
    <CURSET .ROW 1>
    <DO (I <LOWCORE SCRH> 1 -1) <PRINTC !\ >>
    <CURSET .ROW 1>>

<ROUTINE PRESS-A-KEY ()
    <TELL CR "[Press a key to continue]" CR>
    <INPUT 1>
    <RETURN>>

<ROUTINE UPDATE-STATUS-LINE ("AUX" WIDTH)
    <SPLIT 1>
    <SCREEN 1>
    <SET WIDTH <LOWCORE SCRH>>
    <HLIGHT ,H-INVERSE>
    <LINE-ERASE 1>
    <COND (,HERE
        <CURSET 1 1>
        <TELL D ,HERE>
    )>
    <SCREEN 0>
    <HLIGHT 0>>

<ROUTINE QUIT-MSG ()
    <TELL CR "Thanks for playing" ,PERIOD-CR>
    <QUIT>>
