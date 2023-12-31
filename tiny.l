%option yylineno
%option noyywrap
/*pledge my Honor that I have not cheated, and will not cheat, on this assignment. -JOhn Meyers*/

%{
  #define DEBUG 1
  typedef YYTOKENTYPE int Token;
  Token scanned(Token t);
%}

digit   [0-9]+
id   [a-z][a-z0-9]*


%%

if             {return scanned(IF);}
then             {return scanned(THEN);}
else             {return scanned(ELSE);}
end             {return scanned(END);}
repeat             {return scanned(REPEAT);}
until             {return scanned(UNTIL);}
read             {return scanned(READ);}
write             {return scanned(WRITE);}
over             {return scanned(OVER);}
":="             {return scanned(ASSIGN);}
"="             {return scanned(EQ);}
"<"             {return scanned(LT);}
"+"    {return scanned(PLUS);}
"-"         {return scanned(MINUS);}
"*"             {return scanned(TIMES);}
"("	{return scanned(LPAREN);}
")"	{return scanned(RPAREN);}
";"	{return scanned(SEMI);}
"error"		{return scanned(ERROR);}
{id} 	{return scanned(ID);}
{digit} 	{return scanned (NUM);}
<<EOF>>		{return scanned(ENDFILE);}

"{"        { char c = input();
             while(c!='}' && c!=EOF) c=input();
           }


%%

/* process and return scanned token t */
Token scanned(Token t) {
  if(DEBUG==0) return t;
  switch(t) {
    case IF: printf("IF "); return t;
    case THEN: printf("THEN "); return t;
    case ELSE: printf("ELSE "); return t;
    case END: printf("END "); return t;
    case REPEAT: printf("REPEAT "); return t;
    case UNTIL: printf("UNTIL "); return t;
    case READ: printf("READ "); return t;
    case WRITE: printf("WRITE "); return t;
    case ASSIGN: printf("ASSIGN "); return t;
    case EQ: printf("EQ "); return t;
    case LT: printf("LT "); return t;
    case ID: printf("ID(%s)", yytext); return t;
    case OVER: printf("OVER "); return t;
    case PLUS: printf("PLUS "); return t;
    case MINUS: printf("MINUS "); return t;
    case TIMES: printf("TIMES "); return t;
    case LPAREN: printf("LPAREN "); return t;
    case RPAREN: printf("RPAREN "); return t;
    case ERROR: printf("ERROR "); return t;
    case SEMI: printf("SEMI "); return t;
    case NUM: printf("NUM "); return t;
    case ENDFILE: printf("ENDFILE\n"); return t;
    default: printf("ERROR: invalid token in scanned().\n"); exit(-1);
  }
}


