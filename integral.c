typedef enum tokenType { IDENTIFICADOR, LITERAL, OPERADOR , RESERVADA}  
tipoToken;

typedef struct SS simbolo;
typedef struct LL linea;

struct SS{ //estructura que corresponde a un simbolo
char *nombre;   //puntero al token, por ejemplo "X"
tipoToken token;  //dice a que tipo de token corresponde nombre
linea *primerAparicion; //puntero a las lineas donde aparece nombre
simbolo *siguiente;
}  ;

struct LL{//estructura que corresponde a la posicion de un token en una 
linea

int numeroLinea;
int numeroApariciones;
linea *siguiente;

}     ;

simbolo *primerSimbolo;

char *nombreTipoToken[ ] = {"IDENTIFICADOR", "LITERAL", "OPERADOR", 
"RESERVADA"}    ;

//inserta una paricion de un token en una linea, si es la primera aparicion 

linea*  insertarLinea(linea *line, int numLinea){

linea *actual;



if (line==NULL) {
        line=(linea*)malloc(sizeof(linea));
        line->numeroLinea=numLinea;
        line->numeroApariciones=1;
        return line;}
else{
        actual=line;

        while(actual!=NULL){

                if (actual->numeroLinea == numLinea) 
{actual->numeroApariciones++; return line;}



        if (actual->siguiente ==NULL){

        actual->siguiente=  (linea*)malloc(sizeof(linea));
         actual->siguiente->numeroLinea=numLinea;
        actual->siguiente->numeroApariciones=1;
        return line;}

         actual=actual->siguiente;

        }
}

return line;

}

//inserta un simbolo en la tabla, recibe el nombre del token, el tipo de 
token y la linea donde aparece
void insertarSimbolo(char *name, tipoToken tok, int line){

simbolo* actual;



if (primerSimbolo == NULL){

        primerSimbolo= (simbolo *)malloc(sizeof(simbolo));
        primerSimbolo->nombre=strdup(name);
        primerSimbolo->token=tok;
        
primerSimbolo->primerAparicion=insertarLinea(primerSimbolo->primerAparicion, 
line);
        }
else{
        actual=primerSimbolo;

        while(actual != NULL) {



        if (strcmp(actual->nombre, name) == 0) 
{insertarLinea(actual->primerAparicion, line); return;}



        if (actual->siguiente == NULL){

        actual->siguiente =  (simbolo *)malloc(sizeof(simbolo));
        actual->siguiente->nombre=strdup(name);
        actual->siguiente->token=tok;
        
actual->siguiente->primerAparicion=insertarLinea(actual->siguiente->primerAparicion, 
line);
        return;}

        actual = actual ->siguiente;

        }
        }
}

//despliega las apariciones de una palabra en las lineas respectivas
void desplegarLineas(linea *line){



linea *actual=line;




while(actual!=NULL) {
        printf("(");
        printf("%i",actual->numeroLinea);
        printf(",%i",actual->numeroApariciones);

        if (actual -> siguiente == NULL) printf (")\n");
        else printf( ") , ");

        actual=actual->siguiente;

}


}

//despliega en pantalla la tabla de simbolos
void desplegarTablaSimbolos(){
simbolo* actual=primerSimbolo;
printf("Token \t\t\t TipoToken \t\t (Linea,NoApariciones)\n\n");

while (actual!=NULL) {printf("%s \t\t\t %s \t\t", actual->nombre, 
nombreTipoToken[actual->token]);
                                 desplegarLineas(actual->primerAparicion);
                                     actual=actual->siguiente;}

}

int main(){

  int x = 12345678;

insertarSimbolo("X" , IDENTIFICADOR, 1);
insertarSimbolo("X" , IDENTIFICADOR, 1);
insertarSimbolo("+" , OPERADOR, 1);
insertarSimbolo("1234" , LITERAL, 1);
insertarSimbolo("X" , IDENTIFICADOR, 1);
insertarSimbolo("alejandro quesada" , LITERAL, 1);
insertarSimbolo("X" , IDENTIFICADOR, 2);
insertarSimbolo("1234" , LITERAL, 2);
insertarSimbolo("alejandro quesada" , LITERAL, 3);
insertarSimbolo("X" , IDENTIFICADOR, 4);
insertarSimbolo("alejandro quesada" , LITERAL, 4);
insertarSimbolo("X" , IDENTIFICADOR, 4);
desplegarTablaSimbolos();

printf("\n\n");

return (0);
}
