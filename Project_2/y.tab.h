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
    STR_VAL = 260,
    ID_VAL = 261,
    BOOL_VAL = 262,
    BOOL = 263,
    BREAK = 264,
    CHAR = 265,
    CONTINUE = 266,
    DO = 267,
    ELSE = 268,
    ENUM = 269,
    EXTERN = 270,
    FALSE = 271,
    FLOAT = 272,
    FOR = 273,
    FN = 274,
    IF = 275,
    IN = 276,
    INT = 277,
    LET = 278,
    LOOP = 279,
    MATCH = 280,
    MUT = 281,
    PRINT = 282,
    PRINTLN = 283,
    PUB = 284,
    RETURN = 285,
    SELF = 286,
    STATIC = 287,
    STR = 288,
    STRUCT = 289,
    TRUE = 290,
    USE = 291,
    WHERE = 292,
    WHILE = 293
  };
#endif
/* Tokens.  */
#define INT_VAL 258
#define DOUBLE_VAL 259
#define STR_VAL 260
#define ID_VAL 261
#define BOOL_VAL 262
#define BOOL 263
#define BREAK 264
#define CHAR 265
#define CONTINUE 266
#define DO 267
#define ELSE 268
#define ENUM 269
#define EXTERN 270
#define FALSE 271
#define FLOAT 272
#define FOR 273
#define FN 274
#define IF 275
#define IN 276
#define INT 277
#define LET 278
#define LOOP 279
#define MATCH 280
#define MUT 281
#define PRINT 282
#define PRINTLN 283
#define PUB 284
#define RETURN 285
#define SELF 286
#define STATIC 287
#define STR 288
#define STRUCT 289
#define TRUE 290
#define USE 291
#define WHERE 292
#define WHILE 293

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 13 "parser.y" /* yacc.c:1909  */

    int val;
    double dval;
    bool bval;
    string* sval;
    /* sym_table_id tabval; */

#line 138 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
