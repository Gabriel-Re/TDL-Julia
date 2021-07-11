### A Pluto.jl notebook ###
# v0.14.8

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 89e3d7f5-5de6-4a23-9cc2-c6e46acd7db8
import Pkg

# ╔═╡ 73bdb148-e50f-4ecb-9374-26c52ecbe8f0
Pkg.add("GR")

# ╔═╡ eb72f39c-01cc-45d3-80d7-ba353a1da0d2
Pkg.add("Plots")

# ╔═╡ b12443bb-cdee-40de-b686-05c5f84392f4
Pkg.add("Plotly")

# ╔═╡ 4202a0ee-8a17-4d10-a8f2-82dfc69c76c4
using Plots

# ╔═╡ 26a0baf0-df8e-11eb-2440-d70422c64cf2
md"

# Series de Fourier

"

# ╔═╡ 166d1b83-f978-4681-911c-cef5cecf62fe
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

# ╔═╡ 22e112c2-bbbe-4f54-89c4-e369f474c3f2
md"

### Ejemplos de aplicacion con Julia

"

# ╔═╡ 5286a885-f19f-463e-9592-151d6e0d7449
md"

En principio, como vamos a utilizar plots, debemos incluir la biblioteca **Pkg** y añadir lo necesario a la misma:

"

# ╔═╡ 839c4bc5-a6ea-4880-aba0-7863bc7b7c04
md"

#### Valor absoluto

"

# ╔═╡ dcc9eaf0-8ecf-4106-80a6-487cb6067dc7
md"

Aproximación de la función valor absoluto con series de Fourier:

$\quad f(x)= |x|\quad \text{, en el intervalo}\ [-\pi , \pi]$

$|x| \approx \frac{\pi}{2}-\frac{4}{\pi} \sum_{n=1}^\infty \frac{cos(2n-1)}{(2n-1)^2}\quad\text{ , en el intervalo }[-\pi , \pi]$

"

# ╔═╡ 43442163-bfa3-4fe5-a4c8-2d132b627006
md"
Valor de N:
"

# ╔═╡ da3093f8-0a11-419b-b3f6-b92474a3277d
@bind valor_n1 html"""<input type=range min="0" max="10">"""

# ╔═╡ a07482fd-1327-42d5-a9a4-9a7b0d211662
valor_n1

# ╔═╡ 3d6fdd5e-3bfe-4466-bc59-807b030dc380
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
	plot!(x_1, f_1.(x_1,valor_n1), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label="N");
end

# ╔═╡ 54df6e4c-2082-4bd9-adcb-83c5a8658fb3
md" #### Función en un intervalo  "

# ╔═╡ 6000fc51-b365-4e58-b8fb-ddf1d7fc41ec
md"

Aproximación de una recta en un intervalo con series de Fourier

$\quad f(x) = x\quad\text{ , en el intervalo }[-\pi , \pi]$

$x \approx 2 \sum_{n=1}^\infty \frac{(-1)^{n+1}}{n}sen(nx)$
"

# ╔═╡ 9c9dc210-04e8-4331-a1c5-8299acdde479
md"
Valor de N:
"


# ╔═╡ f7392589-2f02-4007-9e34-89c30bc9317f
@bind valor_n2 html"""<input type=range min="0" max="2000">"""

# ╔═╡ b0121c0e-9171-4872-ab27-44b88191894e
valor_n2

# ╔═╡ a582ac96-4c7d-4fa7-b963-4fab3db3bde1
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
	plot_general_2 = plot!(x_2, f_2.(x_2,valor_n2), xticks = ([-π:π:π;], ["-\\pi","0","\\pi"]), label = "N");
	gr(size = (700, 650))
	plot_general_2
end

# ╔═╡ 231996ee-6d9d-461d-9aaf-4d7f18581d6b


# ╔═╡ 9733cc69-df63-4ca9-a8bd-80578d39c278
md"""
### Fuentes
"""

# ╔═╡ 11c7e26b-51f8-4321-b8cb-9f23a3e8a0cf
md"""
https://www.youtube.com/watch?v=dZrShAGqT44&ab_channel=SteveBrunton

https://www.youtube.com/watch?v=r6sGWTCMz2k

https://es.wikipedia.org/wiki/Serie_de_Fourier

http://databookuw.com/databook.pdf

https://wikunia.github.io/Javis.jl/dev/tutorials/tutorial_1/
"""

# ╔═╡ Cell order:
# ╟─26a0baf0-df8e-11eb-2440-d70422c64cf2
# ╟─166d1b83-f978-4681-911c-cef5cecf62fe
# ╟─22e112c2-bbbe-4f54-89c4-e369f474c3f2
# ╟─5286a885-f19f-463e-9592-151d6e0d7449
# ╠═89e3d7f5-5de6-4a23-9cc2-c6e46acd7db8
# ╠═73bdb148-e50f-4ecb-9374-26c52ecbe8f0
# ╠═eb72f39c-01cc-45d3-80d7-ba353a1da0d2
# ╠═b12443bb-cdee-40de-b686-05c5f84392f4
# ╠═4202a0ee-8a17-4d10-a8f2-82dfc69c76c4
# ╟─839c4bc5-a6ea-4880-aba0-7863bc7b7c04
# ╟─dcc9eaf0-8ecf-4106-80a6-487cb6067dc7
# ╟─43442163-bfa3-4fe5-a4c8-2d132b627006
# ╟─a07482fd-1327-42d5-a9a4-9a7b0d211662
# ╟─da3093f8-0a11-419b-b3f6-b92474a3277d
# ╠═3d6fdd5e-3bfe-4466-bc59-807b030dc380
# ╟─54df6e4c-2082-4bd9-adcb-83c5a8658fb3
# ╟─6000fc51-b365-4e58-b8fb-ddf1d7fc41ec
# ╟─9c9dc210-04e8-4331-a1c5-8299acdde479
# ╟─b0121c0e-9171-4872-ab27-44b88191894e
# ╟─f7392589-2f02-4007-9e34-89c30bc9317f
# ╠═a582ac96-4c7d-4fa7-b963-4fab3db3bde1
# ╟─231996ee-6d9d-461d-9aaf-4d7f18581d6b
# ╟─9733cc69-df63-4ca9-a8bd-80578d39c278
# ╟─11c7e26b-51f8-4321-b8cb-9f23a3e8a0cf
