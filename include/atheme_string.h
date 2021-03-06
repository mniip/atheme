/*
 * Copyright (c) 2005 Atheme Development Group
 * Rights to this code are as documented in doc/LICENSE.
 *
 * String stuff.
 */

#ifndef ATHEME_INC_ATHEME_STRING_H
#define ATHEME_INC_ATHEME_STRING_H 1

void strip(char *line);
void strip_ctrl(char *line);

#ifndef HAVE_STRTOK_R
char *strtok_r(char *s, const char *delim, char **lasts);
#endif

#ifndef HAVE_STRCASESTR
char *strcasestr(char *s, const char *find);
#endif

#endif /* !ATHEME_INC_ATHEME_STRING_H */
