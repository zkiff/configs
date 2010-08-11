
import XMonad
-- import XMonad.Actions.Search
-- import XMonad.Prompt
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
-- import XMonad.Util.Scratchpad
import System.IO
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers
import Data.Monoid

fullFloatFocused = withFocused $ \f -> windows =<< appEndo `fmap` runQuery
                   doFullFloat f

myManageHook = composeAll
               [ className =? "Namoroka" --> doShift "1"
	       	 , className =? "Pidgin" --> doShift "8"
		 , className =? "Firefox" --> doShift "1"
               ] 
               <+> 
               composeOne [ isFullscreen -?> doFullFloat ]

main = do
    xmproc <- spawnPipe "xmobar /home/skiff/.xmobarrc"
    xmonad $ defaultConfig
        {
	  terminal    = "urxvt"
	, manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig -- managedocks für gap
        , startupHook = setWMName "LG3D"
 	, layoutHook = smartBorders $ avoidStruts $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "red" "" . shorten 125
                        }
        , modMask = mod4Mask
        } `additionalKeys`
        [ 
          ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock") -- meta shift z 
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s") -- print --> screenshot
        , ((0, xK_Print), spawn "scrot")
        , ((mod4Mask .|. shiftMask, xK_Home), fullFloatFocused)
	, ((0, 0x1008ff11), spawn "cmus-remote -v -4")
        , ((0, 0x1008ff13), spawn "cmus-remote -v +4")
        , ((0, 0x1008ff14), spawn "cmus-remote -u")
	, ((0, 0x1008ff17), spawn "cmus-remote -n")
	, ((0, 0x1008ff16), spawn "cmus-remote -p")
        ]	