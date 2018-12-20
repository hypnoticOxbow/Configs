    import System.IO
    import System.Exit
    import qualified Data.List as L
    import qualified XMonad.StackSet as W

    import Control.Monad (when)
    import Graphics.X11.ExtraTypes.XF86 ( xF86XK_MonBrightnessUp
                                    , xF86XK_MonBrightnessDown
                                    , xF86XK_AudioMute
                                    , xF86XK_AudioRaiseVolume
                                    , xF86XK_AudioLowerVolume
                                    , xF86XK_Display
                                    , xF86XK_ScreenSaver
                                    )

    import XMonad
    import Data.IORef (IORef(..), newIORef, readIORef, writeIORef)
    --import Foreign (unsafePerformIO)
    import XMonad.Actions.CycleWS (nextWS, prevWS, shiftToNext, shiftToPrev)
    import XMonad.Actions.MouseGestures
    import XMonad.Actions.PhysicalScreens (viewScreen, sendToScreen)
    import XMonad.Actions.WithAll (sinkAll)
    import XMonad.Config.Desktop (desktopLayoutModifiers)
    --import XMonad.Config.Xfce
    import XMonad.Hooks.EwmhDesktops (ewmh) -- for touchegg
    import XMonad.Hooks.ManageDocks
    import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat, doCenterFloat)
    import XMonad.Hooks.SetWMName (setWMName)
    --import System.Taffybar.Hooks.PagerHints (pagerHints)
    import XMonad.Layout.NoBorders (smartBorders)
    import XMonad.Layout.WindowArranger (windowArrange)
    import XMonad.Layout.WindowNavigation (Navigate(Go, Swap), Direction2D(U, R, D, L), windowNavigation)

    --import XMonad.Layout.SimpleFloat
    import XMonad.Util.Run(spawnPipe, safeSpawn)
    import XMonad.Util.EZConfig(additionalKeys, additionalMouseBindings)

    import XMonad.Hooks.DynamicLog


    import XMonad.Util.Scratchpad
    import qualified XMonad.StackSet as W
    import qualified Data.Map        as Map


    myTerminal = "kitty"
    myScratchPadTerminal = "urxvt"
    setKeyboardMapping :: X ()
    setKeyboardMapping = spawn "setxkbmap -layout us \
        \-variant intl_nodeadkeys \
        \-option ctrl:nocaps \
        \-option lv3:ralt_switch \
        \&& xmodmap -e 'keycode 135 = Super_L' \
        \&& xset m 0 0"


    resetBackground :: X ()
    resetBackground = spawn "nitrogen --restore"

    --myMouseBindings = [ ( ( 0, button1 ), mouseGesture gestures ) ]

    --mouseGestureButton :: Button
    --mouseGestureButton = button3 -- right click
--
    --sendMouseClickToWindow :: Window -> X ()
    --sendMouseClickToWindow win =
        --safeSpawn
            --"xdotool" ["click", "--window", show win, show mouseGestureButton]
--
    --myMouseGestures :: [([Direction2D], Window -> X ())]
    --myMouseGestures =
        --[ ([R], const nextWS) -- move to the next workspace
        --, ([L], const prevWS) -- move to the previous workspace
        --, ([], sendMouseClickToWindow)
        --]
--
    --addMouseGestures :: XConfig a -> XConfig a
    --addMouseGestures =
        --flip additionalMouseBindings
          --[((0, mouseGestureButton), mouseGesture $ Map.fromList myMouseGestures)]

    --gestures = Map.fromList
      --[ ( [ L ], \_ -> nextWS )
      --, ( [ U ], \_ -> nextWS )
      --, ( [ R ], \_ -> prevWS )
      --, ( [ D ], \_ -> prevWS )
      --]

    myKeys conf@(XConfig {XMonad.modMask = modm}) = Map.fromList $
        [((modm, xK_Return), spawn $ XMonad.terminal conf)
        , ((modm, xK_g), sendMessage ToggleStruts)
        , ((modm .|. controlMask .|. shiftMask,xK_g),sendMessage $ SetStruts [] [D])
        , ((modm,               xK_Down),  nextWS)
        , ((modm,               xK_Up),    prevWS)
        , ((modm .|. shiftMask, xK_Down),  shiftToNext)
        , ((modm .|. shiftMask, xK_Up),    shiftToPrev)
        , ((modm,               xK_f     ), spawn "dmenu_run -fn '-*-clean-*-*-*-*-35-*'")

    -- close focused window
        , ((modm, xK_x     ), kill)
        , ((modm, xK_o ), scratchpadSpawnActionTerminal myScratchPadTerminal)
    -- Rotate through the available layout algorithms
        , ((modm,               xK_space ), sendMessage NextLayout)
    --  Reset the layouts on the current workspace to default
        , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    -- Resize viewed windows to the correct size
--, ((modm,               xK_n     ), refresh)
    -- Move window focus
        , ((modm,               xK_Tab   ), windows W.focusDown)
        , ((modm,               xK_j     ), sendMessage $ Go D)
        , ((modm,               xK_k     ), sendMessage $ Go U)
        , ((modm,               xK_h     ), sendMessage $ Go L)
        , ((modm,               xK_l     ), sendMessage $ Go R)
        , ((modm .|. shiftMask, xK_j   ), sendMessage $ Swap D)
        , ((modm .|. shiftMask, xK_k   ), sendMessage $ Swap U)
        , ((modm .|. shiftMask, xK_h   ), sendMessage $ Swap L)
        , ((modm .|. shiftMask, xK_l   ), sendMessage $ Swap R)
        , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
        , ((modm .|. shiftMask, xK_j     ), windows W.focusDown  )
        , ((modm .|. shiftMask, xK_k     ), windows W.focusUp    )
        , ((modm .|. shiftMask, xK_t     ), sinkAll    )
        , ((modm .|. controlMask, xK_h     ), sendMessage $ Shrink) -- Shrink the master area
        , ((modm .|. controlMask, xK_k     ), sendMessage $ Expand) -- Shrink the master area
    -- Push window back into tiling
        , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    -- Increment the number of windows in the master area
        , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    -- Deincrement the number of windows in the master area
        , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    -- Quit xmonad
        , ((modm .|. controlMask, xK_x     ), io (exitWith ExitSuccess))
    --Rotation:
        --, ((modm,               xK_i     ), spawn "xrandr --output eDP1 --rotate inverted")
        , ((modm .|. shiftMask,               xK_i     ), spawn "xrandr --output eDP1 --rotate inverted")
        , ((modm .|. shiftMask,               xK_u     ), spawn "xrandr --output eDP1 --rotate normal")
        , ((modm .|. shiftMask,               xK_y     ), spawn "xrandr --output eDP1 --rotate left")
    --Touchpad
        , ((modm .|. shiftMask, xK_m     ), spawn "xinput enable 'SYNA2B31:00 06CB:7F8B Touchpad'")
        , ((modm,               xK_m     ), spawn "xinput disable 'SYNA2B31:00 06CB:7F8B Touchpad'")
    --Screenshot
        , ((modm .|. controlMask, xK_s     ), spawn "sh ~/.local/bin/screenshotFull")
    --Music Player hotkeys
        , ((modm,               xK_n     ), spawn "playerctl next")
        , ((modm,               xK_b     ), spawn "playerctl play-pause")
        , ((modm,               xK_v     ), spawn "playerctl previous")

    --Passmenu Coolness
        , ((modm,               xK_p     ), spawn "sh ~/.local/bin/passmenu")

    --i3lock -- screensaver
        , ((modm .|. controlMask, xK_l     ), spawn "i3lock-fancy -pf Fura-Code-Regular-Nerd-Font-Complete-Mono -t \"Incitatus - karin010\"")
    -- Restart xmonad
        , ((modm .|. controlMask, xK_y     ), spawn "xmonad --recompile; xmonad --restart")
        , ((modm .|. controlMask .|. shiftMask, xK_k), setKeyboardMapping)
        {-, ((modm, xK_a), viewScreen 0)
         -, ((modm, xK_d), viewScreen 1)
         -, ((modm .|. shiftMask, xK_a), sendToScreen 0)
         -, ((modm .|. shiftMask, xK_d), sendToScreen 1)-}
        ]
            ++
    -- Workspace keybindings
        [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_4] ++
            [xK_q, xK_w, xK_e, xK_r] ++
            [xK_5 .. xK_9] ++
            [xK_0, xK_minus, xK_equal, xK_grave])
            , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

    ------------------------------------------------------------------------
    -- Mouse bindings: default actions bound to mouse events
    --
{-    myMouseBindings (XConfig {XMonad.modMask = modm}) = Map.fromList $
 -    -- mod-button1, Set the window to floating mode and move by dragging
 -        [ ((modm .|. controlMask, button1), (\w -> focus w >> mouseMoveWindow w
 -                >> windows W.shiftMaster))
 -    -- mod-button2, Raise the window to the top of the stack
 -{-, ((modm, button2), (\w -> focus w >> windows W.shiftMaster))-}
 --- mod-button3, Set the window to floating mode and resize by dragging
 -        , ((modm .|. controlMask, button3), (\w -> focus w >> mouseResizeWindow w
 -            >> windows W.shiftMaster))
 --- you may also bind events to the mouse scroll wheel (button4 and button5)
 -        ]-}

    myLayout = avoidStruts $ windowArrange $ windowNavigation $ desktopLayoutModifiers $ smartBorders $ tiled ||| Mirror tiled ||| Full
        where
        tiled   = Tall nmaster delta ratio -- default tiling algorithm partitions the screen into two panes
        nmaster = 1 -- The default number of windows in the master pane
        ratio   = 1/2 -- Default proportion of screen occupied by master pane
        delta   = 3/100 -- Percent of screen to increment by when resizing panes
{-myIcons layout
 -    | is "Mirror ResizableTall"     = "<icon=/home/ian/.xmonad/icons/layout-mirror.xbm/>"
 -    | is "ResizableTall"            = "<icon=/home/ian/.xmonad/icons/layout-tall.xbm/>"
 -    | is "BSP"                      = "<icon=/home/ian/.xmonad/icons/layout-bsp.xbm/>"
 -    | is "Full"                     = "<icon=/home/ian/.xmonad/icons/layout-full.xbm/>"
 -    | is "Simple Float"             = "<icon=/home/ian/.xmonad/icons/layout-float.xbm/>"
 -    | otherwise                     = "<icon=/home/ian/.xmonad/icons/layout-gimp.xbm/>"
 -where is = (`L.isInfixOf` layout)-}

    myIcons layout
        | is "Mirror ResizableTall"     = "<icon=/home/ian/.xmonad/icons/layout-mirror.xbm/>"
        | is "ResizableTall"            = "<icon=/home/ian/.xmonad/icons/layout-tall.xbm/>"
        | is "BSP"                      = "<icon=/home/ian/.xmonad/icons/layout-bsp.xbm/>"
        | is "Full"                     = "<icon=/home/ian/.xmonad/icons/layout-full.xbm/>"
        | is "Simple Float"             = "<icon=/home/ian/.xmonad/icons/layout-float.xbm/>"
        | otherwise                     = "<icon=/home/ian/.xmonad/icons/layout-gimp.xbm/>"
      where is = (`L.isInfixOf` layout)

    manageScratchPad :: ManageHook
    manageScratchPad = scratchpadManageHook (W.RationalRect l t w h)
        where
        h = 0.4     -- terminal height, 40%
        w = 0.5       -- terminal width, 100%
        t = 1 - h   -- distance from top edge, 90%
        l = 1 - w   -- distance from left edge, 0%

    myManageHook = composeAll
        [ checkDock                     --> doIgnore
        , className =? "MPlayer"        --> doFloat
        , className =? "Vivaldi-stable" --> doShift "2"
        , className =? "vivaldi-stable" --> doShift "2"
        , className =? "Signal"         --> doShift "3"
        , className =? "yakuake"        --> doFloat
        , className =? "Yakuake"        --> doFloat
        , className =? "Kmix"           --> doFloat
        , className =? "kmix"           --> doFloat
        , title     =? "plasma"         --> doFloat
        , title     =? "Plasma"         --> doFloat
        , className =? "plasmashell"    --> doFloat
        , className =? "plasma-desktop" --> doFloat
        , className =? "Plasma-desktop" --> doFloat
        , className =? "nm-applet"      --> doFloat
        , className =? "Pavucontrol"    --> doCenterFloat
        , className =? "Notifications"  --> doFloat
        , className =? "notifications"  --> doFloat
        , className =? "ksplashsimple"  --> doFloat
        , className =? "leanshot"       --> doFloat
        , className =? "ksplashqml"     --> doFloat
        , className =? "ksplashx"       --> doFloat
        , className =? "Gimp"           --> doFloat
        , resource  =? "desktop_window" --> doIgnore
        , resource  =? "gnomedesktop"   --> doIgnore
        , className =? "jetbrains-idea" --> doFloat
        , isFullscreen                  --> doFullFloat
        , return True --> doF W.swapDown]

--rotationState = unsafePerformIO (newIORef 0)
    --rotationStates = ["left", "inverted", "right", "normal"]

--rotateScreen :: IORef Integer -> X ()
    --rotateScreen index = do
    --  val <- io $ readIORef index
--  io $ writeIORef index (mod (val + 1) (fromIntegral (length rotationStates)))
    --  spawn $ "xrandr --output eDP1 --rotate " ++ rotationStates!!(fromIntegral val)


    main = do
           xmproc <- spawnPipe "/home/ian/.local/bin/xmobar"

           xmonad $ docks $ ewmh $ def {
            terminal = myTerminal,
            modMask  = mod4Mask, -- Windows key
            workspaces         = ["1","2","3","4", "q", "w", "e", "r", "5","6","7","8","9", "0", "-", "="],
            normalBorderColor  = "#dddddd",
            focusedBorderColor = "#0099CC",
            focusFollowsMouse  = True,
            clickJustFocuses   = False,
            borderWidth        = 1,
            keys               = myKeys,
            logHook            = dynamicLogWithPP xmobarPP
                      { ppOutput = hPutStrLn xmproc
                     , ppCurrent = xmobarColor "#51afef" "" . wrap "[" "]"   -- #9BC1B2 #69DFFA
                     , ppTitle = xmobarColor "#c678dd" "" . shorten 50       -- #9BC1B2 #69DFFA
                     , ppLayout = xmobarColor "#ECBE7B" "" . myIcons }
            , layoutHook         = myLayout
            , manageHook         = manageScratchPad <+> myManageHook <+> manageHook def,
                startupHook = do
                    setKeyboardMapping
                    spawn "~/.local/bin/butler"
                    --spawn "~/.local/bin/waitpanels.sh"
                    -- For Java programs (prevents blank screen)
                    setWMName "LG3D"
                    resetBackground
                    --spawn "wmname LG3D"
           }
