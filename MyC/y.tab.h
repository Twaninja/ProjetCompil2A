/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

   /* As a special exception, you may create a larger work that contains
      part or all of the Bison parser skeleton and distribute that work
      under terms of your choice, so long as that work isn't itself a
      parser generator using the skeleton or a modified version thereof
      as a parser skeleton.  Alternatively, if you modify or redistribute
      the parser skeleton itself, you may (at your option) remove this
      special exception, which will cause the skeleton and the resulting
      Bison output files to be licensed under the GNU General Public
      License without this special exception.

      This special exception was added by the Free Software Foundation in
      version 2.2 of Bison.  */

      /* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
enum yytokentype {
    NUM = 258,
    TINT = 259,
    ID = 260,
    AO = 261,
    AF = 262,
    PO = 263,
    PF = 264,
    PV = 265,
    VIR = 266,
    RETURN = 267,
    VOID = 268,
    EQ = 269,
    IF = 270,
    ELSE = 271,
    WHILE = 272,
    AND = 273,
    OR = 274,
    NOT = 275,
    DIFF = 276,
    EQUAL = 277,
    SUP = 278,
    INF = 279,
    PLUS = 280,
    MOINS = 281,
    STAR = 282,
    DIV = 283,
    DOT = 284,
    ARR = 285,
    UNA = 286
};
#endif
/* Tokens.  */
#define NUM 258
#define TINT 259
#define ID 260
#define AO 261
#define AF 262
#define PO 263
#define PF 264
#define PV 265
#define VIR 266
#define RETURN 267
#define VOID 268
#define EQ 269
#define IF 270
#define ELSE 271
#define WHILE 272
#define AND 273
#define OR 274
#define NOT 275
#define DIFF 276
#define EQUAL 277
#define SUP 278
#define INF 279
#define PLUS 280
#define MOINS 281
#define STAR 282
#define DIV 283
#define DOT 284
#define ARR 285
#define UNA 286




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 19 "lang.y"
{
    struct ATTRIBUTE* att;
}
/* Line 1529 of yacc.c.  */
#line 115 "y.tab.h"
YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

