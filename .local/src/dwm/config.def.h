/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int gappx     = 0;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "HackNerdFont:size=16:pixelsize=16:antialias=true:autohint=true", "fontawesome-fonts:size=16:pixelsize=16:antialias=true:autohint=true" };
static const char dmenufont[]       = "HackNerdFont-Regular:size=12";
static const char nor_bg_col[]      = "#202020";
static const char nor_border_col[]  = "#404040";
static const char nor_fg_col[]      = "#bbbbbb";
static const char sel_bg_col[]      = "#005577";
static const char sel_border_col[]  = "#bbbbbb";
static const char sel_fg_col[]      = "#eeeeee";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { nor_fg_col, nor_bg_col, nor_border_col },
	[SchemeSel]  = { sel_fg_col, sel_bg_col, sel_border_col },
	[SchemeInfo] = { sel_fg_col, "#264f78", "#000000" }, 	// infobar middle {text, background, not used but cannot be empty}
};

/* tagging */
static const char *tags[] = { "</>", "=#=", "***", "[/]", ">O<", "B1", "B2", "B3", "B4", "B5" };
//                        terminal,wireshark, api_test, file_exp,pavucontrol
//                        terminal, kdenlive, gimp,   handbrake, pavucontrol

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "TTT",      htile },   /* master is present on the upper portion of the screen */ /* bottom stack */
	// { "H*H",      cmaster }, /* master is present on the middle of the screen */ /* centered master */
	// { "###", 	   grid },		 /* gapless grid layout */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *termcmd[]  = { "kitty", NULL };
// static const char *up_vol[]   = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%",   NULL };
// static const char *down_vol[] = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%",   NULL };
// static const char *mute_vol[] = { "pactl", "set-sink-mute",   "@DEFAULT_SINK@", "toggle", NULL };
// static const char *brighter[] = { "brightnessctl", "set", "5%+", NULL };
// static const char *dimmer[]   = { "brightnessctl", "set", "5%-", NULL };

static const Key keys[] = {
	/* modifier                     key        				function        argument */	
	{ MODKEY,                       XK_q,      				killclient,     {0} },					// kill focused window
	{ MODKEY|ShiftMask,             XK_q,             quit,           {0} },					// quits dwm
	{ MODKEY|ShiftMask,             XK_b,      				togglebar,      {0} },					// toggles the dwm bar
	{ MODKEY,                       XK_x,      				focusstack,     {.i = +1 } },			// shifts focus to next window below stack
	{ MODKEY,                       XK_f,      				focusstack,     {.i = -1 } },			// shifts focus to next window above stack
	{ MODKEY|ShiftMask,             XK_x,      				movestack,      {.i = +1 } }, 			// move window downwards the stack
	{ MODKEY|ShiftMask,             XK_f,      				movestack,      {.i = -1 } },			// move window upwards the stack
	{ MODKEY,                       XK_e,      				setmfact,       {.f = -0.05} }, 		// resize window - makes master windows smaller
	{ MODKEY,                       XK_i,      				setmfact,       {.f = +0.05} },			// resize window - makes slave windows smaller
	{ MODKEY|ShiftMask,             XK_e,   					incnmaster,     {.i = +1 } },			// brings adjacent slave window on master stack
	{ MODKEY|ShiftMask,             XK_i,							incnmaster,     {.i = -1 } },			// brings adjacent master window on slave stack
	{ MODKEY,                  			XK_Tab,    				zoom,           {0} },                  // brings window to the master 
	{ MODKEY|ShiftMask,             XK_Tab,    				view,           {0} },					// moves to last used tag
	{ MODKEY,                       XK_equal,      		setlayout,      {.v = &layouts[0]} },   // sets vertical tiling layout mode
	{ MODKEY,                       XK_space,  				setlayout,      {.v = &layouts[1]} },   // sets floating layout mode
	{ MODKEY,                       XK_m,      				setlayout,      {.v = &layouts[2]} },   // sets monocle layout mode
	{ MODKEY|ShiftMask,             XK_equal,      		setlayout,      {.v = &layouts[3]} },   // sets horizontal tiling layout mode
	// { MODKEY|ShiftMask,            XK_c,      			setlayout,      {.v = &layouts[4]} },	// sets centered master tiling mode
	// { MODKEY|ShiftMask, 						XK_g,						setlayout, 			{.v = &layouts[5]} },	// sets grid layout mode
	{ MODKEY|ShiftMask,             XK_space,  				togglefloating, {0} },					// toggle between activated layout mode and floating mode for selected window
	{ MODKEY,                       XK_minus,  				setgaps,        {.i = -1 } },			// decreases window gaps
	{ MODKEY,                       XK_plus,  				setgaps,        {.i = +1 } },			// increases window gaps
	{ MODKEY|ShiftMask,             XK_plus,  				setgaps,        {.i = 0  } },			// sets default window gaps

	TAGKEYS(                        XK_a,             				        0)
	TAGKEYS(                        XK_r,                      				1)
	TAGKEYS(                        XK_s,  				                    2)
	TAGKEYS(                        XK_t,          				            3)
	TAGKEYS(                        XK_g,           			          	4)
	TAGKEYS(                        XK_6,                             5)
	TAGKEYS(                        XK_7,                             6)
	TAGKEYS(                        XK_8,                             7)
	TAGKEYS(                        XK_9,                             8)
	TAGKEYS(                        XK_0,                             9)
	
	// extra added keyboard shortcuts
	{ MODKEY,                       XK_Return, 				spawn,          {.v = termcmd } },		  // spawns terminal (kitty)
	{ MODKEY,				             		XK_w,             spawn,          SHCMD("setbg")},        // sets or changes background
	{ MODKEY,                       XK_comma,         spawn,          SHCMD("maim ~/multimedia/screenshots/\"Screenshot_$(date +%Y-%m-%d_%T).png\"")}, // gets screenhot of full window
	{ MODKEY|ShiftMask,             XK_comma,         spawn,          SHCMD("maim | xclip -selection clipboard -t image/png")}, // gets screenshots of full window and stores in clipboard
  { MODKEY,                       XK_period,        spawn,          SHCMD("maim --select ~/multimedia/screenshots/\"Screenshot_$(date +%Y-%m-%d_%T).png\"")}, // enable user to select screenshot
	{ MODKEY|ShiftMask,             XK_period,        spawn,          SHCMD("maim --select | xclip -selection clipboard -t image/png")}, // enables user to select screenshot and stores in clipboard
	{ MODKEY,												XK_l,             spawn, 					SHCMD("slock -m \"Locked at  $(date \"+%a %d, %H:%M:%S\")\"")},
	{ MODKEY,												XK_b,							spawn,					SHCMD("/usr/bin/brave-browser")},
	{ MODKEY, 											XK_p,							spawn, 					SHCMD("/usr/bin/pavucontrol")},
	{ MODKEY|ShiftMask, 						XK_g,							spawn, 					SHCMD("/usr/bin/gimp")},
	{ MODKEY, 											XK_k,							spawn, 					SHCMD("/usr/bin/kdenlive")},
	{ MODKEY, 											XK_v,							spawn, 					SHCMD("/usr/bin/virt-manager")},
	{ MODKEY,												XK_d,							spawn,					SHCMD("/usr/local/bin/dmenu_run")},
	// { MODKEY,											XK_h,							spawn,					SHCMD("flatpak run fr.handbrake.ghb")},
	// { MODKEY, 											XK_a,							spawn, 					SHCMD("/usr/bin/audacity")},
	// { MODKEY, 											XK_o,							spawn, 					SHCMD("/usr/bin/obs")},
  // { MODKEY, 											XK_u, 						spawn, 					{.v = up_vol } },			// increases volume
  // { MODKEY, 											XK_y, 						spawn, 					{.v = down_vol } },		// decreases volume
  // { MODKEY|ShiftMask,						XK_m,        			spawn,					{.v = mute_vol } },		// toggles mute and last set volume
  // { MODKEY|ShiftMask, 						XK_u,							spawn, 					{.v = brighter } },		// increases brightness
  // { MODKEY|ShiftMask,						XK_y,							spawn, 					{.v = dimmer } },			// decreases brightness

	// unused shortcuts
	{ MODKEY,                       XK_j,      				view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_j,      				tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_apostrophe, 		focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_colon,      		focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_apostrophe,		tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_colon, 				tagmon,         {.i = +1 } }
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} }, // toggles betwwen current and last selected layout
	{ ClkLtSymbol,          0,              Button2,        setlayout,      {.v = &layouts[4]} },	// sets monocle layout on middle click
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[5]} },	// sets floating layout on right click
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },			// moves window using left click mouse
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },			// resizes window using right click mouse
	{ ClkTagBar,            0,              Button1,        view,           {0} },			// views the tag pressed by left click mouse
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

static const Rule rules[] = {0
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
//	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
//	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

