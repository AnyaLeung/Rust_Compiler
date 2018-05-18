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
    KW_BOOL = 263,
    KW_BREAK = 264,
    KW_CHAR = 265,
    KW_CONTINUE = 266,
    KW_DO = 267,
    KW_ELSE = 268,
    KW_ENUM = 269,
    KW_EXTERN = 270,
    KW_FALSE = 271,
    KW_FLOAT = 272,
    KW_FOR = 273,
    KW_FN = 274,
    KW_IF = 275,
    KW_IN = 276,
    KW_LET = 277,
    KW_LOOP = 278,
    KW_MATCH = 279,
    KW_MUT = 280,
    KW_PRINT = 281,
    KW_PRINTLN = 282,
    KW_PUB = 283,
    KW_RETURN = 284,
    KW_SELF = 285,
    KW_STATIC = 286,
    KW_STR = 287,
    KW_STRUCT = 288,
    KW_TRUE = 289,
    KW_USE = 290,
    KW_WHERE = 291,
    KW_WHILE = 292,
    SELF_INCRE = 293,
    SELF_DECRE = 294,
    GRE_EQU = 295,
    SMA_EQU = 296,
    EQUAL_TO = 297,
    NOT_EQUAL_TO = 298,
    ANDAND = 299,
    OROR = 300,
    ADD_SELF = 301,
    MINUS_SELF = 302,
    MUL_SELF = 303,
    DIV_SELF = 304,
    UMINUS = 305,
    UPLUS = 306
  };
#endif
/* Tokens.  */
#define INT_VAL 258
#define DOUBLE_VAL 259
#define STR_VAL 260
#define ID_VAL 261
#define BOOL_VAL 262
#define KW_BOOL 263
#define KW_BREAK 264
#define KW_CHAR 265
#define KW_CONTINUE 266
#define KW_DO 267
#define KW_ELSE 268
#define KW_ENUM 269
#define KW_EXTERN 270
#define KW_FALSE 271
#define KW_FLOAT 272
#define KW_FOR 273
#define KW_FN 274
#define KW_IF 275
#define KW_IN 276
#define KW_LET 277
#define KW_LOOP 278
#define KW_MATCH 279
#define KW_MUT 280
#define KW_PRINT 281
#define KW_PRINTLN 282
#define KW_PUB 283
#define KW_RETURN 284
#define KW_SELF 285
#define KW_STATIC 286
#define KW_STR 287
#define KW_STRUCT 288
#define KW_TRUE 289
#define KW_USE 290
#define KW_WHERE 291
#define KW_WHILE 292
#define SELF_INCRE 293
#define SELF_DECRE 294
#define GRE_EQU 295
#define SMA_EQU 296
#define EQUAL_TO 297
#define NOT_EQUAL_TO 298
#define ANDAND 299
#define OROR 300
#define ADD_SELF 301
#define MINUS_SELF 302
#define MUL_SELF 303
#define DIV_SELF 304
#define UMINUS 305
#define UPLUS 306

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

#line 164 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
