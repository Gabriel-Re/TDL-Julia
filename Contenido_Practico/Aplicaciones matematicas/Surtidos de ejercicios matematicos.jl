### A Pluto.jl notebook ###
# v0.14.8

using Markdown
using InteractiveUtils

# ╔═╡ cde43e53-02c4-46cf-a0a4-29ed8339d07f
import Pkg

# ╔═╡ 4830f653-235a-4734-bee9-6a46734e44f0
Pkg.add("GR")

# ╔═╡ c45d696b-0ada-41d9-b74b-e64f2ef960b6
Pkg.add("Plots")

# ╔═╡ 23405876-e42c-41e3-95e7-0b0acd1d4a1b
Pkg.add("Plotly")

# ╔═╡ b883a567-4645-472f-b191-c44be8791390
Pkg.add("PyPlot")

# ╔═╡ b2fd891b-591e-44f5-b4bc-bbdf7e84c6b0
using LinearAlgebra

# ╔═╡ 31e7a4c1-4234-4a09-b44f-3532a8fe55ad
using Plots

# ╔═╡ d73c1b30-d6b4-11eb-2696-bfc007431ade
md"""
# Matemática con Julia
Lo que vamos a hacer en este informe es mostrar los posibles usos matemáticos de Julia. Muy importante: importar **LinearAlgebra** para el uso de todas las funciones algebráicas.
"""

# ╔═╡ 9f31022d-1f76-462b-9932-daf6c7fefb78
md"""
Procedemos con la inclusión de la biblioteca
"""

# ╔═╡ 6d5dbaef-e413-478d-b4bb-5385299c3244
md"""
### Operaciones particulares
"""

# ╔═╡ e9aef70b-4fcf-49f1-9d18-56aae758857d
md"""
###### Para una matríz:
"""

# ╔═╡ b4ee50fa-c89e-4735-b9ad-70ef76039fe3
A = [1 2 3 ; 4 5 6 ; 7 8 9]

# ╔═╡ 9011b4d6-065d-4d59-875b-3dfceaad0be3
md"""
* autovalores: **egivals(A)**
* autovectores: **eigvecs(A)**
* diagonal: **Diagonal(A)**
* determinante: **det(A)**
* inversa: **inv(A)**
* traza: **trace(A)**
* rango: **rank(A)**
* descomposición en valores singulares: **svd(A)**

"""				

# ╔═╡ 84e40553-ac94-48a2-a8cb-d15b95e790c5
md"""

###### Para vectores:

"""

# ╔═╡ 44ff34d5-d1b9-47e8-b026-6c3c6d3d2bf1
a = [1 , 2 , 3]

# ╔═╡ 392adf14-14e7-4b84-a906-cf20f42bd496
b = [4 , 5 , 6]

# ╔═╡ 6b60e494-d71a-43b4-a4ae-9eb91a9809c2
md"""

* producto interno entre a y b: **dot(a, b)**
* producto vetorial entre a y b: **cross(a, b)**
* suma de todos los elementos: **sum(a)**
* producto de todos los elementos: **prod(a)**
* máximo del vector: **maximum(a)**
* mínimo del vector: **minimum(a)**
"""

# ╔═╡ df723216-e46f-4390-afe7-a089cb6b6d78
md"""
##### Indexación
"""

# ╔═╡ e043429d-21fb-49df-b1b6-d9b67a055aa8
md"""

Como en este caso no ese puede remarcar una diferencia clara de indexación entre matrices y vectores, a continuación se va a mostrar las indexaciones más típicas en ambos casos.

"""

# ╔═╡ f65ec030-2f70-4ede-bcdd-a4b040c1ccc6
A

# ╔═╡ a9c01bef-3d78-4f28-b3bf-e5a2b199f6ff
A[1,1]

# ╔═╡ acb5fca9-36d4-4dfe-9ad0-866f21d64356
A[:,1]

# ╔═╡ 7f3be6ac-4d5e-4b01-9318-15fe89930f8e
A[1,:]

# ╔═╡ 8761bbdc-504c-4fcf-b8ba-5eebdaae25ae
w = [1 , 8 , 3 , 7 , 5 , 6]

# ╔═╡ 584ee357-6b74-4605-8b66-735f9a2a54e7
w[1]

# ╔═╡ 7db6e9b8-6752-40c0-b13f-65c0abe8e6cb
w[end]

# ╔═╡ 9b329847-08d6-4e9b-a644-d2f586217e19
w[[1,4]]

# ╔═╡ 4b017601-0371-4e67-853e-1325d2a05101
w[1:4]

# ╔═╡ b7f7a620-8b29-4479-b444-26c4b5ecd77e


# ╔═╡ dd2400e6-ea15-4d42-a277-fe82ded3126c
md"""
### Uso práctico de Julia
"""

# ╔═╡ bdf1f01c-6f5c-4a53-99ef-22ee13eef3d7
md"#### Descomposición en valores singulares
"

# ╔═╡ 92ff8495-efa3-486c-9264-0973c9262643
md"

Si $F::SVD$ ($F$ es de tipo $SVD$) se puede obtener $U$, $S$ y $V$ de la siguiente manera:

$U = F\cdot U$

$S=F\cdot S$  

$V = F\cdot V\ \text{ó para devolver la transpuesta}\ F\cdot Vt$

Para ver si la $SVD$ se realizo correctamente se puede realizar la siguiente operación:

$$A =U\cdot Diagonal(S)\cdot Vt$$

"

# ╔═╡ c3412c42-ce23-4c1f-aec1-378b9d94edfc
md"
En principio vamos a demostrar como se puede realizar una svd básica de una matríz 3x3 en menos de un segundo con la herramienta **svd()** quie provee Julia.
"

# ╔═╡ 0f162b98-6539-419d-8849-06be55cd9ae9
md"
Aprovechamos la función **rand()** para crear una matríz aleatoria de 3x3:
"

# ╔═╡ bb3ecfaa-9166-4e47-906c-bd1dcd739bf7
B = rand(0:12, 3 , 3)

# ╔═╡ b4158510-7786-4956-b8bc-09dce86be5ed
md"
Una vez creada la matríz lo único que tenemos que hacer es llamar a la función:
"

# ╔═╡ 07657e38-af68-4f1b-953a-e896c1b22310
F = svd(B)

# ╔═╡ 62a575c8-74cb-4bed-87a9-7e65230ff881
md"

Para mostrar que la herramienta funciona correctamente componemos nuevamente la matríz a partir de la SVD encontrada:

"

# ╔═╡ d195cbe8-6199-484b-b9fa-cc89d38a98a0
F.U * Diagonal(F.S)*F.Vt

# ╔═╡ 0e99db64-4734-4891-b933-979385955447
md"

Ahora para mostrar uno de los grandes beneficios de usar Julia, además de **realizar una SVD en un solo paso**, se puede obtener la misma de una matríz de 5.000 x 5.000 en aproximadamente **140 segundos**, esto quiere decir que se procesan **25 millones de datos** en poco más de **2 minutos**.

"

# ╔═╡ 59acb51e-18d6-49ee-be01-7a98ff07bdfe
C = rand(5,5)

# ╔═╡ d0e00985-c554-491a-80f0-914a0e823b00
G = svd(C)

# ╔═╡ a4d5353b-80b2-47b9-ae47-32ed9f695147
md"

Nuevamente componemos la matríz para ver si resulta la misma:

"

# ╔═╡ 6ab71ae0-120b-4918-8724-c5d4cf54a273
G.U * Diagonal(G.S) * G.Vt

# ╔═╡ ed3734b4-4a28-46da-8921-98de2202a43c
md"

En aproximadamente **10 segundos** comprobamos que es la descomposición es exacta.

"

# ╔═╡ c5693993-643e-4201-ade9-a8a458cdc703
md"

Si quisieramos trabajar con las matríces de la descomposición lo que deberíamos hacer es solamente guardarlas en variables de la siguente manera:

"

# ╔═╡ 3d2cb020-8470-4b27-a98a-2cdfa5760179
u, s, v = G;

# ╔═╡ 1d526c33-f653-4e3b-ad1a-904fb60d0f06
u

# ╔═╡ 3d386d59-5a67-4b31-b550-8355c3940919
s

# ╔═╡ c65fc986-31f4-4756-8688-d7fba7665c7b
v

# ╔═╡ 67847137-8a7b-4257-84f9-2843c78dbb7c
md"
###### Para qué usar SVD?

- Compresión de imagenes:

Si consideramos a la imagen como una matrix de píxeles, podemos aplicarle la svd y quedarnos con los r valores singulares más grandes (aproximaciónn de rango r), mientras mas chico r mayor sera la compresión.

![Pixeles](https://www.tutorialexample.com/wp-content/uploads/2019/11/svd-tutorials-and-examples.png)

Tener en cuenta que estamos descartando info importante para la imagen

![Compresión de imágenes](https://i.imgur.com/gDVB0Jo.png)Lo que se puede hacer con compresión de imagenes

http://timbaumann.info/svd-image-compression-demo/

**Otras aplicaciones:**

- Reducción de dimensiones de un dataset
- Information retrieval, Analisis Semantico Latente(LSA)
- Sistemas de recomendación
- Procesamiento de señales
- Motores de busqueda (ver CubeSVD p.ej)


**Lecturas recomendadas**

- Lectura de G. Strang:
  https://www.youtube.com/watch?v=mBcLRGuAFUk  

- Algo de intuición sobre lo que hace la SVD:
  https://gregorygundersen.com/blog/2018/12/10/svd/ 

- Explicación con algo de código:
  https://ethen8181.github.io/machine-learning/dim_reduct/svd.html 

"

# ╔═╡ cd019c4d-2c61-4650-9377-4b8f0740ad82


# ╔═╡ 732bcb6f-7e3c-4a3d-bc5e-7e75b41c2d50
md"

#### Fibonacci recursivo


"

# ╔═╡ d35d2d40-6d08-4320-aba9-8c3f8f3f28df
md"

###### Teoría

La secuencia se genera suamndo dos numeros consecutivos para obtener el siguiente.

La sucesión comienza en el 1 y para saber el siguiente numero de la sucesión  se le suma el anterior: 

1 + 0 = 1

Y asi con todos los numeros. Es importante recordar que ya hay definiciones preestablecidas, a continuación hago referencia a ellas:

###### Definición recurrente

Los numeros de Fibonacci quedan definidos por las ecuaciones

$f_0=0$
$f_1=1$
$f_n=f_{n-1}+f_{n-2}$

Esto produce los siguientes numeros:


$f_2=1$
$f_3=2$
$f_4=3$
$f_5=5$
$f_6=8$
$f_7=13$
$f_8=21$

Y así sucesivamente.

Esta manera de definir, de hecho considerada algoritmica, es usual en matemática discreta.

Es importante definir $f_0=0$ para que se pueda cumplir la importante propiedad de que: $f_n$ divide a $f_{m+n}$ para cualquier $m,n>=1$.

"

# ╔═╡ a38d5f8d-f185-4539-98f3-1c189d436c86
md"

###### Implementación en Julia

"

# ╔═╡ ea134f4e-17b2-41c6-afed-fa59a4ed9d2f
function Fibonacci(numero)
           if numero < 2
               return numero
           else
               return Fibonacci(numero-1)+Fibonacci(numero-2)
           end
       end

# ╔═╡ ebb9352c-ddc8-4d15-a53c-f8606c2dd143
md"

Probamos si funciona correctamente:

"


# ╔═╡ 58bbdf98-ba67-481c-a43f-b31871c30446
Fibonacci(8)

# ╔═╡ af4e5084-a324-4b21-a5e4-3bfd9a60d785
md"

Observo que al ingresar un valor muy elevado la ejecución tarda demasiado tiempo, esto se debe a que Julia no tiene llamados a optimización como si lo tiene el compilador de C.

"

# ╔═╡ 043aa580-fb73-4e99-b8e3-e2adc0c9f130


# ╔═╡ e6e4df37-6e5a-4252-8c13-4abb83714aab
md"

#### Serie de Fourier

"

# ╔═╡ 95bbcbe7-da5f-47e9-8e1c-c08886cb2a5c
md"

**Bibliografia:**

https://www.youtube.com/watch?v=dZrShAGqT44&ab_channel=SteveBrunton

https://www.youtube.com/watch?v=r6sGWTCMz2k

https://es.wikipedia.org/wiki/Serie_de_Fourier

http://databookuw.com/databook.pdf

https://wikunia.github.io/Javis.jl/dev/tutorials/tutorial_1/

"

# ╔═╡ 6712942a-a642-4c9d-aa8d-f6b02b3ef55f
md"""

##### Introducción a la Serie de Fourier
Existen muchas maneras de representar la serie (una de ellas con complejos) pero no vamos a mostrar todas, para dar una introducción básica nos vamos a centrar en una:

$P(t)=\frac{a_0}{2}+\sum_{n=1}^\infty\left[a_n\ cos\left(2\pi n\frac{1}{T}t\right)+b_n\ sen\left(2\pi n\frac{1}{T}t\right)\right]$
Para empezar hay que saber que:
* Existen condiciones de convergencia de la Serie de Fourier a $P(t)$
* El periodo ($T$) es el tiempo en el que se tarda en completar un ciclo
* La frecuencia es la cantidad de ciclos que se cumplen en un determinado tiempo

##### Condiciones de convergencia
La serie converge a $P(t)$ si $P(t)$ es:
* Función periódica
* Continua a trozos
* Acotada
* En un periodo cualquiera debe tener un número finito de máximos y mínimos locales y un número finito de discontinuidades.

Para comenzar tenemos que entender que en los argumentos de coseno y seno de la serie se encuentra explícita la frecuencia fundamental de la función que queremos representar ($\frac{1}{T}$), pero, al estar la frecuencia acompañada de una $n$ lo que se tiene en realidad es un multiplo de la frecuencia fundamental.

Algo útil de saber es que los coeficientes $a_n$ y $b_n$ nos dicen nos dicen "que tanto se parecen" las funciones seno o coseno (dependiendo de a quien acompañen) con la original. Por ejemplo, si $a_0$ es 0 y $b_0$ es 1 con n $\in [0,1]$ quiere decir que la función original se parece mucho a $sen(2\pi \frac{1}{T}t)$.

Lo que Fourier quizo mostrar es que sumando una cantidad determinada de senos y cosenos, de amplitudes y frecuencias determinadas que son multiplo de la fundamental, se puede representar cualquier función.

![imagen](https://ocw.aprende.org/courses/mathematics/18-103-fourier-analysis-fall-2013/18-103-f13.jpg)

Lo que se ve en la imagen es la suma de funciones seno y coseno de diferentes frecuencias pero mismas amplitudes. De esta manera se puede sumar muchas funciones hasta que la funcion termina siendo prácticamente igual a la buscada.

No vamos a entrar más a fondo porque no es la idea. Vamos a mostrar como se puede emplear esto en la práctica con Julia y lo sencillo que es.

"""

# ╔═╡ 27ab170c-b500-4346-a98a-ece6812edf80


# ╔═╡ 7da7048b-5e8b-4bdf-b3e0-a4610935a3ce
md"

#### Ejemplos de aplicación con Julia

"

# ╔═╡ 75574783-8c9e-4203-96b6-6304f136283a
md"

En principio, como vamos a utilizar plots, debemos incluir la biblioteca **Pkg** y añadir lo necesario a la misma:

"

# ╔═╡ e670921c-12b4-4709-99b4-5e02cafaa594
md"

##### Valor absoluto

"

# ╔═╡ 1ccd4f43-23b8-4256-96f8-775a4f7d30c4
md"

Aproximación de la función valor absoluto con series de Fourier:

$\quad f(x)= |x|\quad \text{, en el intervalo}\ [-\pi , \pi]$

$|x| \approx \frac{\pi}{2}-\frac{4}{\pi} \sum_{n=1}^\infty \frac{cos(2n-1)}{(2n-1)^2}\quad\text{ , en el intervalo }[-\pi , \pi]$

"

# ╔═╡ b756f72a-fc27-4490-b979-8e1214691875
begin
	function f_1(x_1, N)
	  sum = 0.0
	  for n = 1:N
	    sum = sum + cos((2*n-1)*x_1)/(2*n-1)^2
	  end
	  return π/2 - (4/π)*sum
	end
	
	x_1= -π:0.01:π
	
	
	plot(x_1, abs.(x_1), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label="x", legend=:bottomleft);
	plot!(x_1, f_1.(x_1,1), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label="N = 1");
	plot!(x_1, f_1.(x_1,2), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label="N = 2");
	plot!(x_1, f_1.(x_1,3), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label="N = 3");
	plot!(x_1, f_1.(x_1,6), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label="N = 6");
	plot!(x_1, f_1.(x_1,10), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label="N = 10");
	plot_general_1 =plot!(x_1, f_1.(x_1,100), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label="N = 100");
end

# ╔═╡ 0b34e7a5-44e1-40f4-8dc5-f6e5d3103dbb
begin
	gr(size = (800, 700))
	plot_1 = plot(x_1, abs.(x_1), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label="x", legend=:bottomleft, title = "Valor absoluto de x");
	plot_2 = plot(x_1, f_1.(x_1,1), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label="N = 2", title = "Serie de Fourier con n = 1");
	plot_3 = plot(x_1, f_1.(x_1,2), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label="N = 6", title = "Serie de Fourier con n = 2");
	plot_4 = plot(x_1, f_1.(x_1,3), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label="N = 25", title = "Serie de Fourier con n = 3");
	plot_5 = plot(x_1, f_1.(x_1,6), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label="N = 100", title = "Serie de Fourier con n = 6");
	plot_6 = plot(x_1, f_1.(x_1,10), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label="N = 250", title = "Serie de Fourier con n = 10");
	plot(plot_1, plot_2, plot_3, plot_4, plot_5, plot_6, layout = (3, 2), legend = false)
end

# ╔═╡ 69d04673-1d53-4bd1-a392-ffb56e966aca


# ╔═╡ 6efb77b5-376e-4e0e-b503-d430640dfb5b
md"

##### Función en un intervalo

"

# ╔═╡ 3927d8ab-becc-4edf-8e1f-316c7a56159d
md"

Aproximación de una recta en un intervalo con series de Fourier

$\quad f(x) = x\quad\text{ , en el intervalo }[-\pi , \pi]$

$x \approx 2 \sum_{n=1}^\infty \frac{(-1)^{n+1}}{n}sen(nx)$
"

# ╔═╡ 3746b118-256c-47ee-b685-e43e12744689
begin
	function f_2(x_2, N)
	  sum = 0.0
	  for n = 1:N
	    sum = sum + ((-1)^(n+1)/n) * sin(n * x_2)
	  end
	  return 2 * sum
	end
	
	x_2= -π:0.01:π
	
	plot(x_2, x_2, xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label = "x");
	plot!(x_2, f_2.(x_2,5), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label = "N = 5");
	plot!(x_2, f_2.(x_2,50), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label = "N = 50");
	plot_general_2 = plot!(x_2, f_2.(x_2,500), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label = "N = 500");
	gr(size = (700, 650))
	display(plot_general_2)
end

# ╔═╡ 8eea3ace-094c-4335-930e-d3912c6c5e47
begin
	plot_1_1 = plot(x_2, x_2, xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), title = "Función en un intervalo");
	plot_2_2 = plot(x_2, f_2.(x_2,5), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), title = "Serie de Fourier con n = 5");
	plot_3_3 = plot(x_2, f_2.(x_2,50), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), title = "Serie de Fourier con n = 50");
	plot_4_4 = plot(x_2, f_2.(x_2,500), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), title = "Serie de Fourier con n = 500");
	
	gr(size = (700, 650))
	plot(plot_1_1, plot_2_2, plot_3_3, plot_4_4, layout = (2,2), legend = false)
end

# ╔═╡ 17e7439e-dce0-4189-b0bd-f1817d1295d8


# ╔═╡ 9a6b9518-c9ec-4f06-98c2-bf01d6e20b80
md"

## Plots animados

"

# ╔═╡ 5789f6e7-0ceb-4b32-894a-fa1efa8b4043
md"
Mostramos lo que se puede lograr simplemente codeando pequeñas lineas de código
"

# ╔═╡ b3d67726-2eb3-4188-8458-f68cd5dc5744
begin
	gr() 
	p = plot([sin, cos], zeros(0), leg = false)
	anim = Animation()
	for x = range(0, stop = 10π, length = 100)
	    push!(p, x, Float64[sin(x), cos(x)])
	    frame(anim)
	end
	gif(anim, "sen_cos_tdl.gif", fps = 15)
end

# ╔═╡ 4fcb3eb8-1c0e-4d93-97d4-9cbc5dbfdcc1
begin
	#@userplot CirclePlot
	@recipe function f(cp::CirclePlot)
	    x, y, i = cp.args
	    n = length(x)
	    inds = circshift(1:n, 1 - i)
	    linewidth --> range(0, 10, length = n)
	    seriesalpha --> range(0, 1, length = n)
	    aspect_ratio --> 1
	    label --> false
	    x[inds], y[inds]
	end
	
	n = 150
	t = range(0, 2π, length = n)
	x = sin.(t)
	y = cos.(t)

	anim2 = @animate for i ∈ 1:n
		circleplot(x, y, i)
	end
	gif(anim2, "anim2_fps15.gif", fps = 30)
end

# ╔═╡ eac45039-d95f-43d5-a8aa-608cc88139a4
md"
Use **@gif** for simple, one-off animations that you want to view immediately. 
Use **@animate** for anything more complex. Constructing Animation objects can be done when you need full control of the life-cycle of the animation (usually unnecessary though).

"

# ╔═╡ 0e6fde21-edb0-4477-ae57-503526399ac1
begin
	@gif for i ∈ 1:n
    circleplot(x, y, i, line_z = 1:n, cbar = false, framestyle = :zerolines)
	end every 5
end

# ╔═╡ a638cf30-0d88-43b2-94a7-ebe242419b49
begin
	nn = 100
	tt = range(0, 2π, length = nn)
	xx = 16sin.(tt).^3
	yy = 13cos.(tt) .- 5cos.(2tt) .- 2cos.(3tt) .- cos.(4tt)
	@gif for i ∈ 1:n
		circleplot(xx, yy, i, line_z = 1:nn, cbar = false, c = :reds, framestyle = :none)
	end when i > 40 && mod1(i, 10) == 5
end

# ╔═╡ Cell order:
# ╟─d73c1b30-d6b4-11eb-2696-bfc007431ade
# ╟─9f31022d-1f76-462b-9932-daf6c7fefb78
# ╠═b2fd891b-591e-44f5-b4bc-bbdf7e84c6b0
# ╟─6d5dbaef-e413-478d-b4bb-5385299c3244
# ╟─e9aef70b-4fcf-49f1-9d18-56aae758857d
# ╟─b4ee50fa-c89e-4735-b9ad-70ef76039fe3
# ╟─9011b4d6-065d-4d59-875b-3dfceaad0be3
# ╟─84e40553-ac94-48a2-a8cb-d15b95e790c5
# ╟─44ff34d5-d1b9-47e8-b026-6c3c6d3d2bf1
# ╟─392adf14-14e7-4b84-a906-cf20f42bd496
# ╟─6b60e494-d71a-43b4-a4ae-9eb91a9809c2
# ╟─df723216-e46f-4390-afe7-a089cb6b6d78
# ╟─e043429d-21fb-49df-b1b6-d9b67a055aa8
# ╟─f65ec030-2f70-4ede-bcdd-a4b040c1ccc6
# ╠═a9c01bef-3d78-4f28-b3bf-e5a2b199f6ff
# ╠═acb5fca9-36d4-4dfe-9ad0-866f21d64356
# ╠═7f3be6ac-4d5e-4b01-9318-15fe89930f8e
# ╠═8761bbdc-504c-4fcf-b8ba-5eebdaae25ae
# ╠═584ee357-6b74-4605-8b66-735f9a2a54e7
# ╠═7db6e9b8-6752-40c0-b13f-65c0abe8e6cb
# ╠═9b329847-08d6-4e9b-a644-d2f586217e19
# ╠═4b017601-0371-4e67-853e-1325d2a05101
# ╟─b7f7a620-8b29-4479-b444-26c4b5ecd77e
# ╟─dd2400e6-ea15-4d42-a277-fe82ded3126c
# ╟─bdf1f01c-6f5c-4a53-99ef-22ee13eef3d7
# ╟─92ff8495-efa3-486c-9264-0973c9262643
# ╟─c3412c42-ce23-4c1f-aec1-378b9d94edfc
# ╟─0f162b98-6539-419d-8849-06be55cd9ae9
# ╠═bb3ecfaa-9166-4e47-906c-bd1dcd739bf7
# ╟─b4158510-7786-4956-b8bc-09dce86be5ed
# ╠═07657e38-af68-4f1b-953a-e896c1b22310
# ╟─62a575c8-74cb-4bed-87a9-7e65230ff881
# ╠═d195cbe8-6199-484b-b9fa-cc89d38a98a0
# ╟─0e99db64-4734-4891-b933-979385955447
# ╠═59acb51e-18d6-49ee-be01-7a98ff07bdfe
# ╠═d0e00985-c554-491a-80f0-914a0e823b00
# ╟─a4d5353b-80b2-47b9-ae47-32ed9f695147
# ╠═6ab71ae0-120b-4918-8724-c5d4cf54a273
# ╟─ed3734b4-4a28-46da-8921-98de2202a43c
# ╟─c5693993-643e-4201-ade9-a8a458cdc703
# ╠═3d2cb020-8470-4b27-a98a-2cdfa5760179
# ╠═1d526c33-f653-4e3b-ad1a-904fb60d0f06
# ╠═3d386d59-5a67-4b31-b550-8355c3940919
# ╠═c65fc986-31f4-4756-8688-d7fba7665c7b
# ╟─67847137-8a7b-4257-84f9-2843c78dbb7c
# ╟─cd019c4d-2c61-4650-9377-4b8f0740ad82
# ╟─732bcb6f-7e3c-4a3d-bc5e-7e75b41c2d50
# ╟─d35d2d40-6d08-4320-aba9-8c3f8f3f28df
# ╟─a38d5f8d-f185-4539-98f3-1c189d436c86
# ╟─ea134f4e-17b2-41c6-afed-fa59a4ed9d2f
# ╟─ebb9352c-ddc8-4d15-a53c-f8606c2dd143
# ╠═58bbdf98-ba67-481c-a43f-b31871c30446
# ╟─af4e5084-a324-4b21-a5e4-3bfd9a60d785
# ╟─043aa580-fb73-4e99-b8e3-e2adc0c9f130
# ╟─e6e4df37-6e5a-4252-8c13-4abb83714aab
# ╟─95bbcbe7-da5f-47e9-8e1c-c08886cb2a5c
# ╟─6712942a-a642-4c9d-aa8d-f6b02b3ef55f
# ╟─27ab170c-b500-4346-a98a-ece6812edf80
# ╟─7da7048b-5e8b-4bdf-b3e0-a4610935a3ce
# ╟─75574783-8c9e-4203-96b6-6304f136283a
# ╠═cde43e53-02c4-46cf-a0a4-29ed8339d07f
# ╠═4830f653-235a-4734-bee9-6a46734e44f0
# ╠═c45d696b-0ada-41d9-b74b-e64f2ef960b6
# ╠═23405876-e42c-41e3-95e7-0b0acd1d4a1b
# ╠═b883a567-4645-472f-b191-c44be8791390
# ╠═31e7a4c1-4234-4a09-b44f-3532a8fe55ad
# ╟─e670921c-12b4-4709-99b4-5e02cafaa594
# ╟─1ccd4f43-23b8-4256-96f8-775a4f7d30c4
# ╠═b756f72a-fc27-4490-b979-8e1214691875
# ╠═0b34e7a5-44e1-40f4-8dc5-f6e5d3103dbb
# ╟─69d04673-1d53-4bd1-a392-ffb56e966aca
# ╟─6efb77b5-376e-4e0e-b503-d430640dfb5b
# ╟─3927d8ab-becc-4edf-8e1f-316c7a56159d
# ╠═3746b118-256c-47ee-b685-e43e12744689
# ╠═8eea3ace-094c-4335-930e-d3912c6c5e47
# ╟─17e7439e-dce0-4189-b0bd-f1817d1295d8
# ╟─9a6b9518-c9ec-4f06-98c2-bf01d6e20b80
# ╟─5789f6e7-0ceb-4b32-894a-fa1efa8b4043
# ╠═b3d67726-2eb3-4188-8458-f68cd5dc5744
# ╠═4fcb3eb8-1c0e-4d93-97d4-9cbc5dbfdcc1
# ╟─eac45039-d95f-43d5-a8aa-608cc88139a4
# ╠═0e6fde21-edb0-4477-ae57-503526399ac1
# ╠═a638cf30-0d88-43b2-94a7-ebe242419b49
