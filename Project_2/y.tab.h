/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INT_VAL = 258,
    DOUBLE_VAL = 259,
    ID_VAL = 260,
    BOOL_VAL = 261,
    BOOL = 262,
    BREAK = 263,
    CHAR = 264,
    CONTINUE = 265,
    DO = 266,
    ELSE = 267,
    ENUM = 268,
    EXTERN = 269,
    FALSE = 270,
    FOR = 271,
    FN = 272,
    IF = 273,
    IN = 274,
    INT = 275,
    LET = 276,
    LOOP = 277,
    MATCH = 278,
    MUT = 279,
    PRINT = 280,
    PRINTLN = 281,
    PUB = 282,
    RETURN = 283,
    SELF = 284,
    STATIC = 285,
    STR = 286,
    STRUCT = 287,
    TRUE = 288,
    USE = 289,
    WHERE = 290,
    WHILE = 291
  };
#endif
/* Tokens.  */
#define INT_VAL 258
#define DOUBLE_VAL 259
#define ID_VAL 260
#define BOOL_VAL 261
#define BOOL 262
#define BREAK 263
#define CHAR 264
#define CONTINUE 265
#define DO 266
#define ELSE 267
#define ENUM 268
#define EXTERN 269
#define FALSE 270
#define FOR 271
#define FN 272
#define IF 273
#define IN 274
#define INT 275
#define LET 276
#define LOOP 277
#define MATCH 278
#define MUT 279
#define PRINT 280
#define PRINTLN 281
#define PUB 282
#define RETURN 283
#define SELF 284
#define STATIC 285
#define STR 286
#define STRUCT 287
#define TRUE 288
#define USE 289
#define WHERE 290
#define WHILE 291

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 14 "parser.y" /* yacc.c:1909  */

    int val;
    double dval;
    bool bval;
    /* string* sval; */
    /* sym_table_id tabval; */

#line 134 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
