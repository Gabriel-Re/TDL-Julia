### A Pluto.jl notebook ###
# v0.14.8

using Markdown
using InteractiveUtils

# ╔═╡ 0ecf04b1-3f48-4804-88f2-ceae5d777be7
using Pkg; Pkg.add("PlutoUI"); using PlutoUI

# ╔═╡ b97612cc-78ed-4ecd-81d9-3186ce2356aa
md"""
# Teoria de los pi

## TDL 2021 1C - Julia 
"""

# ╔═╡ e2e79432-d846-11eb-361f-834dc115621a
md"""
## 1.0 Historia (En revisión)
"""

# ╔═╡ 6c3210c1-0c40-42d5-9c05-ae67d073f528
md"""
Julia se inició en el año 2009, por sus creadores Jeff Bezanson, Stefan Karpinski, Viral B. Shah y Alan Edelman quienes se propusieron crear un lenguaje libre que fuera rápido y de alto nivel.

En el año 2012 el equipo explicó en su blog por qué fue creado Julia.

La principal razón que dieron sus creadores del por qué de la creación del lenguaje a conocer es, "*In short, because we are greedy*" (En resumen, porque somos codiciosos), ya que al ser usuarios avanzados de distintos lenguajes (Matlab, C, Python, Ruby, etc) de programación orientados a distintas areas como por ejemplo: scientific computing, machine learning, data mining, álgebra lineal a gran escala, etc... Sabían que dichos lenguajes eran perfectos para ciertos aspectos del trabajo y pésimo para otros.

A raíz de esto surgé la frase mencionada anteriormente, querían un lenguaje que abarque todos los aspectos positivos de los distintos lenguajes, tales como la velocidad de C, el dinamismo de Ruby, que sea homoicónico con verdaderas macros como Lisp, pero con notación matemática obvia y familiar como Matlab, que sea tan utilizable para la programación general como Python, tan fácil para las estadísticas como R, etc... 

Principalmente se buscaba algo que sea muy fácil de aprender, pero que tambien sea atractivo para aquellos programadores más serios. A pesar de todo lo que pueda a llegar abarcar Julia se busca principalmente que el lenguaje sea simple y claro a la hora de utilizarlo y comprender que es lo que se hace.

https://julialang.org/blog/2012/02/why-we-created-julia/

https://julialang.org/blog/2018/08/one-point-zero/

https://julialang.org/blog/2012/08/design-and-implementation-of-julia/

https://docs.julialang.org/en/v1/
"""

# ╔═╡ 2a599601-ab53-4a38-a67b-de687e099892
md"""
## 2.0 ¿Por qué Julia? (En revisión)
"""

# ╔═╡ 29f312e2-8c00-4fbd-830c-6aa0a8b88eb5
md"""
La elección de un lenguaje de programación es siempre subjetiva. Para nosotros, las siguientes características de Julia son decisivas:

- Julia está desarrollado como un lenguaje de programación de alto rendimiento.

- Julia usa envío múltiple (**“multiple dispatch”** en inglés), que le permite al programador elegir entre diferentes patrones de programación de acuerdo a la aplicación.

- Julia es un lenguaje de tipo dinámico que se puede usar fácilmente de forma interactiva.

- Julia tiene una sintaxis de alto nivel que es fácil de aprender.

- Julia es un lenguaje de programación con tipos opcionales, cuyos tipos de datos (definidos por el usuario) hacen que el código sea claro y robusto.

- Julia tiene una biblioteca estándar extendida, además, están disponibles numerosos paquetes de terceros.

No se necesita de ningún otro lenguaje de programación para escribir código de alto rendimiento. Esto no significa que ocurra automáticamente. Es responsabilidad del programador optimizar el código que genere cuellos de botella, aunque esto puede hacerse directamente en Julia.
"""

# ╔═╡ 6df3f45f-23e5-4cbd-b2bd-a384ec4ad1f0
md"""
## 3.0 Sintaxis (En revisión)
"""

# ╔═╡ 8243daaf-9925-4d57-a693-333d9f415959
md"""
### Primer programa en Julia 

Antes de explicar la sintaxis hablemos de :
Características básicas del lenguaje:
paradigmas que soporta, compilado/interpretado, tipado, control de flujos, tdas, parámetros o cualquier concepto básico particular que soporte el lenguaje
"""

# ╔═╡ cb22a3df-9231-406e-8a79-e15bd3f9a311
VERSION

# ╔═╡ 27f5fe16-d155-4f14-be6f-8498f628a797
println("Hello World")

# ╔═╡ 24517048-2d2a-4ad9-ab5a-edab68faf6a5
md"""
### Variables
"""

# ╔═╡ 05b2a9bb-0199-4718-b6f5-1243ac76d196
md"""
#### Tipos de datos
"""

# ╔═╡ d178d041-c8f7-4d64-8639-a80e4f5ac5d6
with_terminal()	do
	begin
		Variable_int = 4
		println(Variable_int)
		println(typeof(Variable_int))
	end
end	

# ╔═╡ 63aabf72-af27-4499-b222-744ec6b219c3
with_terminal()	do
	begin
		Variable_float = 42.0
		println(Variable_float)
		println(typeof(Variable_float))
	end
end

# ╔═╡ 9846b43a-1ef1-4789-8c86-d4cc6e700806
with_terminal()	do
	begin
		Variable_char = 'A'
		println(Variable_char)
		println(typeof(Variable_char))
	end
end

# ╔═╡ 08992d5b-035a-4c28-b83b-9d39de6fcff3
with_terminal()	do
	begin
		Variable_String = "Hola mundo"
		println(Variable_String)
		println(typeof(Variable_String))
		#println(variable_String)
		# Debería romper, ya que no definimos es variable con minuscula
	end
end

# ╔═╡ d16089a4-10a7-4459-8693-0f1feae18c82
md"""
	Julia es Case sensitive (sabe diferenciar entre mayúsculas y minúsculas)
"""

# ╔═╡ 18911e97-e13c-4b7a-b2a6-90400ec56095
md"""
Veamos las constantes, por ejemplo Epsilon y vamos a intentar redefinirlas.
"""

# ╔═╡ af3fe895-0911-4606-bf43-6d250c2a0f7d
begin
	ℯ
	#ℯ = 10
	#Esto debería romper.
end

# ╔═╡ ab674fde-dd2a-46b3-8e5e-2728ee3c5a0b
md"""
No se pueden redefinir las constantes que existe en un scope global, solamente se pueden redefinir en un scope local, por ejemplo en una función
"""

# ╔═╡ 68e8c842-a1ae-429c-a452-d4f5e1415918
begin
	function cambio_valor_epsilon()
	  ℯ = 10
	  return ℯ + 10
	end
	cambio_valor_epsilon()
end

# ╔═╡ 019ba5ad-4821-4014-b80b-386124346536
md"""
Luego de esa función vuelve a su valor original.
"""

# ╔═╡ 2e059c43-cd26-4ba9-8408-3928cf956a6f
ℯ

# ╔═╡ 62053526-57b6-4fd2-9860-cddc5210e658
md"""
#### Operadores aritmeticos
"""

# ╔═╡ b39e5926-0ad5-4b69-88a3-128ff09f9c90
with_terminal()	do
	begin
		println("Suma:")
		Suma = 4 + 4
		println(Suma)
		println("       ")

		println("Resta:")
		Resta = 4 - 2
		println(Resta)
		println("       ")

		println("Multiplicación:")
		Multiplicacion = 4 * 4
		println(Multiplicacion)
		println("       ")

		println("División:")
		Division = 8/2
		println(Division)
		println("       ")

		println("Potencia:")
		Potencia = 4^4
		println(Potencia)
		println("       ")
	end
end

# ╔═╡ 8482f2ba-0ec4-450c-aaa8-07f4aa7eaad2
md"""
Recordar que el orden de las operaciones es el siguiente:
* Parentesis
* Potenciación
* Multiplicación y División
* Suma resta etc (de izq a der)
"""

# ╔═╡ 3f0b92e0-e2a4-4f5b-9683-05d12e5fcaa9
md"""
#### Expresiones booleanas y operadores
"""

# ╔═╡ 2be3fc4d-742d-4c50-a665-2a4087d4a9ee
5 == 5

# ╔═╡ d30aee32-d86b-4658-92c9-2709f4092474
5 == 6

# ╔═╡ 476ebbf5-20dc-4aba-9f89-2af69a682361
md"""
**Operadores relacionales**

    * == 
    * !=
    * >=
    * <=

**Operadores Logicos**

    * &&
    * ||
    * !
"""

# ╔═╡ b732e0f4-a6c0-40df-bf05-13b6bb4a74b1
md"""
**Evaluación condicional**
"""

# ╔═╡ 90ffdf5c-3924-4f2c-8c9e-a56876f7da5c
with_terminal()	do
	begin
		x = 5
		b = 7

		if x == 4 && b == 4
		  println("El valor de x es 4")
		  println("Y el valor de b es 4") 

		elseif x == 6 && b == 5
		  println("El valor de x es 6")
		  println("Y el valor de b es 5") 

		elseif x == 5 && b == 7
		  println("El valor de x es 5")
		  println("Y el valor de b es 7") 
		else
			println("Tenemos valores no esperados")
		end
	end
end

# ╔═╡ 12794679-c547-491c-9076-1cea06974561
with_terminal()	do
	begin
		i = 1

		println("While:")
		while i <= 5
			println(i)
			i += 1
		end 
		println("Afuera del while")
		println(i)
		
		println("for:")
		for j = 1:5
		  println(j)
		end	
		println("Afuera del for")
		#println(j)
		#El scope del for es local
	end	
end

# ╔═╡ c0cc33e9-8be1-40bc-93f5-45bddbac8aca
md"""
### Estructura de datos
#### Vectores y matrices
"""

# ╔═╡ ab1583bf-b7e6-4de7-a6d2-000993e4643f
md"""
Definición de un **vector**
"""

# ╔═╡ 3a40baf7-cf95-4340-882c-ac27dd42a55e
with_terminal()	do
	begin
		Un_vector = [1, 2, 3]
		println(Un_vector)
		println(typeof(Un_vector))
	end
end

# ╔═╡ c21853a5-8d10-429b-9e60-18f18ef57e77
md"""
Puede ser un vector de distintos tipos de datos y el vector se define como si no fuera de un tipo de dato especifico.
"""

# ╔═╡ c4a96cdd-e01b-42c7-a319-87c5ea71ae7c
with_terminal()	do
	begin
		Otro_vector = [1, 2.0, "3"]
		println(Otro_vector)
		println(typeof(Otro_vector))
	end
end

# ╔═╡ 3de6e128-4b23-4250-9773-89c30fd1b814
md"""
**Los vectores son mutables**
"""

# ╔═╡ b08a484d-9c0d-449a-bd3e-bd6fda2e5dd6
with_terminal()	do
	begin
		println("Defino un vector")
		Otro_vector = [1, 2.0, "3"]
		println(Otro_vector)
		println("Lo modifico")
		Otro_vector[2] = 2
		Otro_vector[3] = 3
		println(Otro_vector)
	end
end

# ╔═╡ 8aba032b-636c-45c2-93e9-99e4488cefea
md"""
**Operaciones básicas**    
"""

# ╔═╡ d085f88d-52a1-4780-8936-00f71f0404b3
with_terminal()	do
	begin
		u = [2, 4, 5]
		v = [1, 2, 3]

		println("Suma de vectores:")
		println(u + v)
		println("Resta de vectores:")
		println(u - v)
		println("Multiplicación de vectores:")
		println(transpose(u) * v)
		println("División de vectores:")
		println(u / v)
	end
end

# ╔═╡ b818e2c7-2641-4d09-bea1-85b2bb44270f
md"""
Definición de **matríz 2x3** de enteros
"""

# ╔═╡ cd22b130-462c-43b3-8b88-c25ac85b3cda
begin
	Una_matrix = [1 2 3 ; 4 5 6] 
	Una_matrix
end


# ╔═╡ 2ac3c653-087d-4cb9-bec4-c971c469db91
md"""
**Operaciones básicas**    
"""

# ╔═╡ 9187a403-12f3-457d-b252-06e06b5a899d
with_terminal()	do
	begin
		A = [1 2 3 ; 4 5 6 ; 7 8 9]
		B = [1 2 3 ; 4 5 6 ; 7 8 9]

		println("Suma de Matrices:")
		println(A + B)
		println("Resta de Matrices:")
		println(A - B)
		println("Multiplicación de Matrices:")
		println(A * B)
		println("División de Matrices:")
		println(A ./ B)
	end
end

# ╔═╡ e7a13942-9fa2-4b71-8a69-cc72f37217b0
md"""
#### Strings
"""

# ╔═╡ afc84b14-1e4d-4c20-8dc3-19147b565161
md"""
En cambio **los Strings son inmutables**
"""

# ╔═╡ 20e3d97a-5c93-4226-b1d5-30fe98708d85
with_terminal()	do
	begin
		saludo = "¡Hola, mundo!"
		#saludo[2] = 'a'
		#rompe al ser inmutable
		println(saludo)
	end
end

# ╔═╡ 1d9beb05-03af-4fbe-9979-68213109b276
with_terminal()	do
	begin
		println("Concatenación de strings:")
		primer_str = "auto"
		segundo_str = "móvil"
		automovil = primer_str * segundo_str
		println(automovil)
		println("Potencia de strings:")
		String_spam = "Spam"^3
		println(String_spam)
	end
end

# ╔═╡ 4f99e9a1-fa12-49ae-92be-a31237ce5607
md"""
#### Tuplas
"""

# ╔═╡ 8494e402-a34b-4db6-bf5d-dcfff31fd45d
md"""
**Las tuplas son inmutables**
"""

# ╔═╡ fc24e894-b19e-48e7-b54f-125f02db55b4
with_terminal()	do
	begin
		tupla = ("Marcos", "Mateo", "Gabriel", "Tomas")
		println(tupla)
		println(typeof(tupla))
		#tupla[1] = "Otro_integrante_del_grupo"
		#Deberia romper
		println("Se puede operar con un cierto rango de la tupla")
		println(tupla[2:3])
	end
end

# ╔═╡ 35cd96c9-229a-4543-bc21-3d58b9baaec5
md"""
#### Diccionarios
"""

# ╔═╡ a66a62fe-5111-4df8-937a-cfdc556ec2c8
with_terminal()	do
	begin
		Creditos_por_materias = Dict("AM2" => 8, "Fisica" => 8, "Algebra2" => 8,"TDL" => 4, "Algo3" => 3)
		println(Creditos_por_materias)
		println("Chequeo que el diccionario tenga cierta clave, por ejemplo busco si está TDL")
		println(haskey(Creditos_por_materias,"TDL"))
		delete!(Creditos_por_materias,"Fisica") #Jaja salu2 me pasé a licenciatura
		println("Elimino Fisica de las materias y chequeo que no este más")
		println(Creditos_por_materias)
	end
end

# ╔═╡ 56b7458c-2ecc-4966-80bd-9d5b667d4dba
md"""
#### Structs
"""

# ╔═╡ 0aa4213a-607a-42e6-b78f-365872b17d33
struct Persona
	altura::Float64
	peso::Float64
end

# ╔═╡ 749ad427-3b22-4198-a3aa-8258a857c982
with_terminal()	do
	begin
		Elfo = Persona(1.80,74)
		println(Elfo)
		println(typeof(Elfo))
		println(Elfo.altura)
		println(Elfo.peso)
		
	end
end

# ╔═╡ 4ad71870-dc7b-4ca1-94f2-739d02e1c0ec
md"""
**Los structs son inmutables**
"""

# ╔═╡ 955dc9f8-647e-4cc4-91e5-c4eceb843ca5
md"""
**Recursividad**
"""

# ╔═╡ 07ac6f25-5e7b-4aa5-8f4a-992c397848ce
with_terminal()	do
	begin
		function cuentaregresiva(n)
			if n <= 0
				println("Despegue!")
			else
				println(n)
				cuentaregresiva(n-1)
			end
		end
		cuentaregresiva(10)
	end
end

# ╔═╡ e5c33281-2164-42ce-8238-b4c1dd7b9684
md"""
**Errores**

Si se produce un **error durante una llamada a función**, Julia imprime el nombre de la función, el nombre de la función que la llamó, el nombre de la función que a su vez llamó a esta otra, y así sucesivamente hasta llegar a la función de más alto nivel Main.

En caso de ser una funcion recursiva que nunca para de llamarse a si misma hace una referencia a stackoverflowerror.

"""

# ╔═╡ 1fb386cf-f6aa-4ff3-8c80-fa516a3f824f
md"""
## 4.0 Multiple dispatch

Es un concepto muy importante en Julia. Ahora ¿Que pingo significa esto ura?. Ya te explico chango, la cosa es así.

Nosotros cuando hablamos de un envio simple estamos hablando de un proceso en donde elegimos un método diferente o versión de una función dependiendo del tipo de entrada

Y el envio multiple (*Multiple dispatch*) significa que miramos todos los tipos de entrada para todos los argumentos de la función para elegir que método o versión vamos a llamar
"""

# ╔═╡ aedff738-6518-4556-98cd-0110eb6e84cb
begin
	#Defino un numero complejo
	cc = 3 +4im #Para definir un imaginario se pone im dsp del num
	#Para poder ver que es lo que realmente hace Julia voy a usar un macro
end

# ╔═╡ 915f5d8c-a6af-4ad4-b2c5-a538ffb7484d
#Para poder ver que es lo que realmente hace Julia voy a usar un macro
@which cc + cc

# ╔═╡ 36161a3e-8c87-464d-8f6c-7a0548de2ece
md"""
Lo que me dice lo de arriba es que se usa un método que recibe dos numeros complejos y los suma.

Ahora vamos a ver que pasa si sumamos un numero real
"""

# ╔═╡ 412bfba9-62d5-4baa-834d-731bfdd894ca
@which cc + 4 

# ╔═╡ 2ec210c9-48c3-4cbe-8fe6-52386fb26299
md"""
Vemos que ahora llama a otro método, entonces esto quiere decir que entre todas las funciones definidas para la suma llama especificamente a aquellas que reciba ciertos parametros esperados

**Nota importante**, cada vez que usamos este macro nos da un link a la implementación, tenganlo en cuenta
"""

# ╔═╡ 115e306d-9bb7-4f3d-b315-3ba8a5f997cc
#Quiero ver cuantos métodos de "+" hay
+


# ╔═╡ Cell order:
# ╟─b97612cc-78ed-4ecd-81d9-3186ce2356aa
# ╠═0ecf04b1-3f48-4804-88f2-ceae5d777be7
# ╟─e2e79432-d846-11eb-361f-834dc115621a
# ╟─6c3210c1-0c40-42d5-9c05-ae67d073f528
# ╟─2a599601-ab53-4a38-a67b-de687e099892
# ╟─29f312e2-8c00-4fbd-830c-6aa0a8b88eb5
# ╟─6df3f45f-23e5-4cbd-b2bd-a384ec4ad1f0
# ╟─8243daaf-9925-4d57-a693-333d9f415959
# ╠═cb22a3df-9231-406e-8a79-e15bd3f9a311
# ╠═27f5fe16-d155-4f14-be6f-8498f628a797
# ╟─24517048-2d2a-4ad9-ab5a-edab68faf6a5
# ╟─05b2a9bb-0199-4718-b6f5-1243ac76d196
# ╠═d178d041-c8f7-4d64-8639-a80e4f5ac5d6
# ╠═63aabf72-af27-4499-b222-744ec6b219c3
# ╠═9846b43a-1ef1-4789-8c86-d4cc6e700806
# ╠═08992d5b-035a-4c28-b83b-9d39de6fcff3
# ╟─d16089a4-10a7-4459-8693-0f1feae18c82
# ╟─18911e97-e13c-4b7a-b2a6-90400ec56095
# ╠═af3fe895-0911-4606-bf43-6d250c2a0f7d
# ╟─ab674fde-dd2a-46b3-8e5e-2728ee3c5a0b
# ╠═68e8c842-a1ae-429c-a452-d4f5e1415918
# ╟─019ba5ad-4821-4014-b80b-386124346536
# ╠═2e059c43-cd26-4ba9-8408-3928cf956a6f
# ╟─62053526-57b6-4fd2-9860-cddc5210e658
# ╟─b39e5926-0ad5-4b69-88a3-128ff09f9c90
# ╟─8482f2ba-0ec4-450c-aaa8-07f4aa7eaad2
# ╟─3f0b92e0-e2a4-4f5b-9683-05d12e5fcaa9
# ╠═2be3fc4d-742d-4c50-a665-2a4087d4a9ee
# ╠═d30aee32-d86b-4658-92c9-2709f4092474
# ╟─476ebbf5-20dc-4aba-9f89-2af69a682361
# ╟─b732e0f4-a6c0-40df-bf05-13b6bb4a74b1
# ╠═90ffdf5c-3924-4f2c-8c9e-a56876f7da5c
# ╠═12794679-c547-491c-9076-1cea06974561
# ╟─c0cc33e9-8be1-40bc-93f5-45bddbac8aca
# ╟─ab1583bf-b7e6-4de7-a6d2-000993e4643f
# ╠═3a40baf7-cf95-4340-882c-ac27dd42a55e
# ╟─c21853a5-8d10-429b-9e60-18f18ef57e77
# ╠═c4a96cdd-e01b-42c7-a319-87c5ea71ae7c
# ╟─3de6e128-4b23-4250-9773-89c30fd1b814
# ╠═b08a484d-9c0d-449a-bd3e-bd6fda2e5dd6
# ╟─8aba032b-636c-45c2-93e9-99e4488cefea
# ╠═d085f88d-52a1-4780-8936-00f71f0404b3
# ╟─b818e2c7-2641-4d09-bea1-85b2bb44270f
# ╠═cd22b130-462c-43b3-8b88-c25ac85b3cda
# ╟─2ac3c653-087d-4cb9-bec4-c971c469db91
# ╠═9187a403-12f3-457d-b252-06e06b5a899d
# ╟─e7a13942-9fa2-4b71-8a69-cc72f37217b0
# ╟─afc84b14-1e4d-4c20-8dc3-19147b565161
# ╠═20e3d97a-5c93-4226-b1d5-30fe98708d85
# ╠═1d9beb05-03af-4fbe-9979-68213109b276
# ╟─4f99e9a1-fa12-49ae-92be-a31237ce5607
# ╟─8494e402-a34b-4db6-bf5d-dcfff31fd45d
# ╠═fc24e894-b19e-48e7-b54f-125f02db55b4
# ╟─35cd96c9-229a-4543-bc21-3d58b9baaec5
# ╠═a66a62fe-5111-4df8-937a-cfdc556ec2c8
# ╠═56b7458c-2ecc-4966-80bd-9d5b667d4dba
# ╠═0aa4213a-607a-42e6-b78f-365872b17d33
# ╠═749ad427-3b22-4198-a3aa-8258a857c982
# ╠═4ad71870-dc7b-4ca1-94f2-739d02e1c0ec
# ╠═955dc9f8-647e-4cc4-91e5-c4eceb843ca5
# ╠═07ac6f25-5e7b-4aa5-8f4a-992c397848ce
# ╠═e5c33281-2164-42ce-8238-b4c1dd7b9684
# ╟─1fb386cf-f6aa-4ff3-8c80-fa516a3f824f
# ╠═aedff738-6518-4556-98cd-0110eb6e84cb
# ╠═915f5d8c-a6af-4ad4-b2c5-a538ffb7484d
# ╟─36161a3e-8c87-464d-8f6c-7a0548de2ece
# ╠═412bfba9-62d5-4baa-834d-731bfdd894ca
# ╟─2ec210c9-48c3-4cbe-8fe6-52386fb26299
# ╠═115e306d-9bb7-4f3d-b315-3ba8a5f997cc
