import System.Directory (listDirectory)

:script /full/path/to/scripts/schelpers.hs
:script /full/path/to/scripts/shortcuts.hs
:script /full/path/to/scripts/harmony.hs
:script /full/path/to/scripts/morse.hs

:{
let bpm x = setcps (x/60/4)
    swB a = swingBy a 8
:}

:{
let drumMachine name ps = stack 
                    (map (\ x -> 
                        (# s (name ++| (extractS "s" (x)))) $ x
                        ) ps)
    drumFrom name drum = s (name ++| drum)
    drumM = drumMachine
    drumF = drumFrom
:}

:{
    list_samples = listDirectory "/full/path/to/samples"
:}

:{
-- Post window functions
let replicator text1 = [putStr (text1) | x <- replicate 1000 text1]
    flood text2      = sequence_(replicator text2) -- from Kindohm
:}
