/* user and group to drop privileges to */
static const char *user  = "sumit";
static const char *group = "sumit";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#005577",   /* during input */
	[FAILED] = "#bb3333",   /* wrong password */
	[CAPS] = "#888833",     /* CapsLock on */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* time in seconds before the monitor shuts down */
static const int monitortime = 5;

/* default message */
static const char * message = "";

/* text color */
static const char * text_color = "#ffffff";

/* text size (must be a valid size) */
static const char * font_name = "-misc-liberation mono-bold-r-normal--0-0-0-0-m-0-iso8859-1";
