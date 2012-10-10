import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    ]

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/hartem/.xmonad/xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook
                       <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
	, terminal = "xterm"

        }`additionalKeys`
        [ ((controlMask , xK_Escape), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((controlMask, xK_grave), spawn "amixer set Master 0")
        , ((controlMask, xK_1), spawn "amixer set Master 5-")
        , ((controlMask, xK_2), spawn "amixer set Master 5+")
        , ((mod1Mask, xK_r), spawn "xterm -e tcsh")
        , ((0, xK_Print), spawn "scrot")
        ]
        

  
