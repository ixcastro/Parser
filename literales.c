"Este es un String "
'\0'
'H','o','l','a','\0'
123
01234567
0XAA20F243
+01234567
-0XAA20F243
1.23f
123.345
123E10
123.22E10
.22E10
.E10   //se separara en OPERADOR ., ID E y numero 10 o error
+1.23f
-123.345
-123E10
0XAA20FGGG  //se espera que separe el hexadecimal del IDENTIFICADOR GGG
123r  //error o separa el numero del IDENTIFICADOR r
ID123  //se espera que se clasifique como un ID
014255689  //se espera que no se acepte como octal y de un error
