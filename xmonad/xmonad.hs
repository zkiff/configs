import XMonad
-- import XMonad.Actions.Search
-- import XMonad.Prompt
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Scratchpad
import System.IO
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers
import Data.Monoid

fullFloatFocused = withFocused $ \f -> windows =<< appEndo `fmap` runQuery
                   doFullFloat f

myManageHook = composeAll
               [ className =? "Namoroka" --> doShift "1"
                 , className =? "Pidgin" --> doShift "8"
		 , className =? "skype-bin" --> doShift "9"
                 , className =? "Firefox" --> doShift "1"
               ] 
               <+> 
               composeOne [ isFullscreen -?> doFullFloat ]
	       <+>
	       scratchpadManageHookDefault	--import scratchpad    		    
			  

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
	, ((0, 0x1008ff12), spawn "mpc volume 0")
        , ((0, 0x1008ff18), spawn "mpc volume -4")
        , ((0, 0x1008ff19), spawn "mpc volume +4")
        , ((0, 0x1008ff14), spawn "mpc toggle")
        , ((0, 0x1008ff17), spawn "mpc next")
        , ((0, 0x1008ff16), spawn "mpc prev")
	, ((0, 0x1008ff15), spawn "mpc stop")
	, ((mod4Mask .|. shiftMask, xK_n), scratchpadSpawnActionTerminal "urxvt")
        ]       
