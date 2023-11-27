def Func_Pascua(año):
  #Julian calendar
  G=(año%19) #Goldennumber - 1
  I=((19*G + 15)%30) #número de días desde el 21 de marzo hasta la luna llena pascual.
  J=((año+(año//4)+I)%7)#Día para luna llena pascual

  #Gregorian calendar
  C=(año//100)
  H=((C-(C//4)-(((8*C)+13)//25)+(19*G)+15)%30)
  I=H-(H//28)*(1-(29//(H+1))*((21-G)//11))
  J=((año+(año//4)+I+2-C+(C//4)))%7
  L=I-J #número de días transcurridos entre el 21 de marzo y el domingo anterior al Luna llena pascual
  mes=3+((L+40)//(44))
  dia=L+28-(31*(mes//4))
  return mes, dia

#Main
año = int(input("Digite el año para calcular la fecha de pascua ")) #Genera el input del año deseado por el usuario
Pascua = Func_Pascua(año) #Funcion para calcular la fecha de pascua, requiere de argumento el año.
print(f"{año}-{Pascua[0]}-{Pascua[1]}")#Imprime el resultado