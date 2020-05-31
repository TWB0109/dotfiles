/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]        = "DejaVu Sans:size=9";
static const char* normbgcolor  = "#10071D";
static const char* normfgcolor  = "#AE61DA";
static const char* selbgcolor   = "#AE61DA";
static const char* selfgcolor   = "#10071D";
static const char* urgbgcolor   = "#111111";
static const char* urgfgcolor   = "#cc0000";
static const char before[]      = "<";
static const char after[]       = ">";
static const char titletrim[]   = "...";
static const int  tabwidth      = 200;
static const Bool foreground    = True;
static       Bool urgentswitch  = False;

/*
 * Where to place a new tab when it is opened. When npisrelative is True,
 * then the current position is changed + newposition. If npisrelative
 * is False, then newposition is an absolute position.
 */
static int  newposition   = 0;
static Bool npisrelative  = False;

#define SETPROP(p) { \
        .v = (char *[]){ "/bin/sh", "-c", \
                "prop=\"`xwininfo -children -id $1 | grep '^     0x' |" \
                "xargs -0 printf %b | dmenu -l 10 -w $1`\" &&" \
                "xprop -id $1 -f $0 8s -set $0 \"$prop\"", \
                p, winid, NULL \
        } \
}

#define MODKEY ControlMask

static Key keys[] = {
	/* modifier             key        function     argument */
	{ MODKEY|ShiftMask,     XK_Return, focusonce,   { 0 } },
	{ MODKEY,               XK_t,      spawn,       { 0 } },

	{ Mod1Mask|ShiftMask,   XK_l,      rotate,      { .i = +1 } },
	{ Mod1Mask|ShiftMask,   XK_h,      rotate,      { .i = -1 } },
	{ Mod1Mask|ShiftMask,   XK_j,      movetab,     { .i = -1 } },
	{ Mod1Mask|ShiftMask,   XK_k,      movetab,     { .i = +1 } },
	{ Mod1Mask,             XK_Tab,    rotate,      { .i = 0 } },

	{ MODKEY,               XK_grave,  spawn,       SETPROP("_TABBED_SELECT_TAB") },
	{ Mod1Mask,               XK_1,      move,        { .i = 0 } },
	{ Mod1Mask,               XK_2,      move,        { .i = 1 } },
	{ Mod1Mask,               XK_3,      move,        { .i = 2 } },
	{ Mod1Mask,                 XK_4,      move,        { .i = 3 } },
	{ Mod1Mask,                 XK_5,      move,        { .i = 4 } },
	{ Mod1Mask,               XK_6,      move,        { .i = 5 } },
	{ Mod1Mask,               XK_7,      move,        { .i = 6 } },
	{ Mod1Mask,               XK_8,      move,        { .i = 7 } },
	{ Mod1Mask,               XK_9,      move,        { .i = 8 } },
	{ Mod1Mask,               XK_0,      move,        { .i = 9 } },

	{ MODKEY,               XK_w,      killclient,  { 0 } },

	{ MODKEY,               XK_u,      focusurgent, { 0 } },
	{ MODKEY|ShiftMask,     XK_u,      toggle,      { .v = (void*) &urgentswitch } },

	{ 0,                    XK_F11,    fullscreen,  { 0 } },
};
