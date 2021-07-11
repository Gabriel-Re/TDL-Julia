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

# ╔═╡ a6c5d552-f1a5-4f6b-a6c2-404c50507d51
import Pkg

# ╔═╡ 61e9a6c6-1ede-46d0-af9a-3674ad0a2269
Pkg.add("Images")

# ╔═╡ 210558d6-3b1d-4570-bdc9-40d1f409b955
Pkg.add("TestImages")

# ╔═╡ 525a7702-4ab4-4a23-92c4-0d0ec46e2e64
using LinearAlgebra

# ╔═╡ ff9177c2-74f7-4b63-baa0-2c1c3c439158
using Images, TestImages

# ╔═╡ 85757e0e-df8b-11eb-265b-c15f54ba8eed
md"

# Descomposición en valores singulares 

"

# ╔═╡ d2135a93-1689-49f0-9b52-a7e7a43d43d6
md"

### A qué nos referimos con DVS (SVD)?

"

# ╔═╡ 0536d707-7c9f-438f-98c3-3fa43d3be792
md"

##### Repaso

"

# ╔═╡ 052a2e19-477b-46b7-8fee-44ceeeea20cf
md"

### $\quad\quad\quad\quad\quad\quad\quad\quad\quad A=U\cdot\Sigma\cdot V^t$

"

# ╔═╡ aa0ca399-b23c-4a36-9a08-261b7951c1b5
md"
En principio vamos a demostrar como se puede realizar una svd básica de una matríz 3x3 en menos de un segundo con la herramienta **svd()** quie provee Julia.
"

# ╔═╡ ddf3ad9a-233f-4ed0-a956-409ef6057e6b
md"
Aprovechamos la función **rand()** para crear una matríz aleatoria de 3x3:
"

# ╔═╡ cc6ec962-da95-4df4-8634-51cc5dd1d871
A = rand(1:12, 3, 3)

# ╔═╡ 46fa9ef6-e0a8-4f54-9e2e-2afec469e46c
md"
Una vez creada la matríz lo único que tenemos que hacer es llamar a la función:
"

# ╔═╡ 7aeabe83-5887-4bf8-a55b-c90868d079e8
F = svd(A)

# ╔═╡ 3e6d8535-54d7-4ff9-bac0-1abd29b1d330
md"

Si $F::SVD$ ($F$ es de tipo $SVD$) se puede obtener $U$, $S$ y $V$ de la siguiente manera:

$U = F\cdot U$

$S=F\cdot S$  

$V = F\cdot V\ \text{ó para devolver la transpuesta}\ F\cdot Vt$

Para ver si la $SVD$ se realizo correctamente se puede realizar la siguiente operación:

$$A =U\cdot Diagonal(S)\cdot Vt$$

"

# ╔═╡ 76646e30-b803-48a7-accd-7c353f01bd65
md"

Para mostrar que la herramienta funciona correctamente componemos nuevamente la matríz a partir de la SVD encontrada:

"

# ╔═╡ 638339a7-c904-41dc-bdc1-2b6b5bd69b32
F.U * Diagonal(F.S)*F.Vt

# ╔═╡ b15b192a-768e-4fdc-a385-5bd1a9e5c319
md"

Ahora para mostrar uno de los grandes beneficios de usar Julia, además de **realizar una SVD en un solo paso**, se puede obtener la misma de una matríz de 5.000 x 5.000 en aproximadamente **140 segundos**, esto quiere decir que se procesan **25 millones de datos** en poco más de **2 minutos**.

"

# ╔═╡ 5ee1f265-63fb-4131-935c-1ab1f20abb7e
B = rand(5000,5000)

# ╔═╡ 12af12b5-02cc-4504-be69-e1a327c32b4c
G = svd(B)

# ╔═╡ 7f269d02-94bf-48be-85f9-e63da4e9e07d
md"

Nuevamente componemos la matríz para ver si resulta la misma:

"

# ╔═╡ d92b2e4d-55be-4a14-b7c9-32d39ec0ec38
G.U * Diagonal(G.S) * G.Vt

# ╔═╡ 1aaa5608-ddf2-4a05-81a5-eb11e4bf1ae6
md"

En aproximadamente **10 segundos** comprobamos que la descomposición es exacta.

"

# ╔═╡ b6770f54-b2c0-4568-9bd5-652c105de2cf
md"

Si quisieramos trabajar con las matríces de la descomposición lo que deberíamos hacer es solamente guardarlas en variables de la siguente manera:

"

# ╔═╡ 128bea90-d7bf-4123-9b27-0cb12f92326a
u, s, v = G;

# ╔═╡ 9195fd80-1cfa-418b-9e2d-d5b5506f443a
u

# ╔═╡ f1b85971-f5a1-4cab-94f6-276d3a8cd947
s

# ╔═╡ c613737c-ef89-4056-91dc-717f6db2c6cc
v

# ╔═╡ 1c5a6f8f-6a0c-40f2-affc-5a9d6d7499a9
md"
###### Para qué usar SVD?

- Compresión de imagenes:

Si consideramos a la imagen como una matrix de píxeles, podemos aplicarle la svd y quedarnos con los r valores singulares más grandes (aproximaciónn de rango r), mientras mas chico r mayor sera la compresión.

![Pixeles](https://www.tutorialexample.com/wp-content/uploads/2019/11/svd-tutorials-and-examples.png)


**Otras aplicaciones:**

- Reducción de dimensiones de un dataset
- Information retrieval, Analisis Semantico Latente(LSA)
- Sistemas de recomendación
- Procesamiento de señales
- Motores de busqueda (ver CubeSVD p.ej)


"

# ╔═╡ 3d4e9e14-4842-48a7-9ba3-028504fe72e2
md"

### Cómo hacer una SVD de una imagen en Julia

"

# ╔═╡ 14460d94-b66e-4ec0-b615-ae9fc217715f
md"

Para demostrar el uso usamos la foto de Dios

"

# ╔═╡ 63d71495-6f69-4523-b81a-fc24db3bc9d1
	dios = mktemp() do fn,f
   	download("https://images.lavoz.com.ar/resizer/p2aWDLHHj1ORsHpuGfX8BzUNcqo=/1023x682/smart/cloudfront-us-east-1.images.arcpublishing.com/grupoclarin/UI5O5B6Q2VES7G7NLNSZN6FULI.jpg", fn)
    load(fn)
	end

# ╔═╡ 2b798a39-6d4c-4d43-bbfd-ce09a86deef8
md"

En este ejemplo mostramos como se puede realizar una descomposición en valores singulares a una imagen y, dependiendo del valor que le demos a **k**, comprimir más o menos la misma.


"

# ╔═╡ 1aff3b68-87ef-4c11-9fac-af74e20accca
md"

Para variar el valor de **k** usamos el siguiente controlador:

"

# ╔═╡ dc23998e-c931-4de0-a86b-b4e47e543710
@bind valor_k html"""<input type=range min="0" max="300">"""

# ╔═╡ 660e5a1f-aaad-46fd-bc5b-9c1be8b39b41
md"

El valor de **k** es:

"

# ╔═╡ 4b653e2a-b0a7-49c4-a4b9-f077e75987eb
valor_k

# ╔═╡ 015451b5-3ae3-4f1f-a82c-9086b00a0373
begin
	img = dios
	channels = channelview(img)
	
	function rank_approx(F::SVD, k)
		U, S, V = F
		M = U[:, 1:k] * Diagonal(S[1:k]) * V[:, 1:k]'
		clamp01!(M)
	end
	
	svdfactors = svd.(eachslice(channels; dims=1))
	imgs = map((valor_k, 100)) do k
	   colorview(RGB, rank_approx.(svdfactors, k)...)
	end
	
	mosaicview(imgs[1]; nrow=1, npad=5)	
end

# ╔═╡ 31e3cb2e-ad7e-43f8-bcb6-cccea07653b8


# ╔═╡ 3fdf97a9-446c-41c9-8192-b08488f31e9e
md"""
### Fuentes
"""

# ╔═╡ 5737405f-7ced-403c-b49f-f8159f95a4e8
md"""
https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/
http://web.mit.edu/julia_v0.6.2/julia/share/doc/julia/html/en/stdlib/linalg.html
https://github.com/JuliaLang/julia/blob/master/stdlib/LinearAlgebra/src/svd.jl
https://juliaimages.org/stable/
"""

# ╔═╡ Cell order:
# ╟─85757e0e-df8b-11eb-265b-c15f54ba8eed
# ╟─d2135a93-1689-49f0-9b52-a7e7a43d43d6
# ╟─0536d707-7c9f-438f-98c3-3fa43d3be792
# ╟─052a2e19-477b-46b7-8fee-44ceeeea20cf
# ╠═525a7702-4ab4-4a23-92c4-0d0ec46e2e64
# ╟─aa0ca399-b23c-4a36-9a08-261b7951c1b5
# ╟─ddf3ad9a-233f-4ed0-a956-409ef6057e6b
# ╠═cc6ec962-da95-4df4-8634-51cc5dd1d871
# ╟─46fa9ef6-e0a8-4f54-9e2e-2afec469e46c
# ╠═7aeabe83-5887-4bf8-a55b-c90868d079e8
# ╟─3e6d8535-54d7-4ff9-bac0-1abd29b1d330
# ╟─76646e30-b803-48a7-accd-7c353f01bd65
# ╠═638339a7-c904-41dc-bdc1-2b6b5bd69b32
# ╟─b15b192a-768e-4fdc-a385-5bd1a9e5c319
# ╠═5ee1f265-63fb-4131-935c-1ab1f20abb7e
# ╠═12af12b5-02cc-4504-be69-e1a327c32b4c
# ╟─7f269d02-94bf-48be-85f9-e63da4e9e07d
# ╠═d92b2e4d-55be-4a14-b7c9-32d39ec0ec38
# ╟─1aaa5608-ddf2-4a05-81a5-eb11e4bf1ae6
# ╟─b6770f54-b2c0-4568-9bd5-652c105de2cf
# ╠═128bea90-d7bf-4123-9b27-0cb12f92326a
# ╠═9195fd80-1cfa-418b-9e2d-d5b5506f443a
# ╠═f1b85971-f5a1-4cab-94f6-276d3a8cd947
# ╠═c613737c-ef89-4056-91dc-717f6db2c6cc
# ╟─1c5a6f8f-6a0c-40f2-affc-5a9d6d7499a9
# ╟─3d4e9e14-4842-48a7-9ba3-028504fe72e2
# ╠═a6c5d552-f1a5-4f6b-a6c2-404c50507d51
# ╠═61e9a6c6-1ede-46d0-af9a-3674ad0a2269
# ╠═210558d6-3b1d-4570-bdc9-40d1f409b955
# ╠═ff9177c2-74f7-4b63-baa0-2c1c3c439158
# ╟─14460d94-b66e-4ec0-b615-ae9fc217715f
# ╟─63d71495-6f69-4523-b81a-fc24db3bc9d1
# ╟─2b798a39-6d4c-4d43-bbfd-ce09a86deef8
# ╟─1aff3b68-87ef-4c11-9fac-af74e20accca
# ╟─dc23998e-c931-4de0-a86b-b4e47e543710
# ╟─660e5a1f-aaad-46fd-bc5b-9c1be8b39b41
# ╟─4b653e2a-b0a7-49c4-a4b9-f077e75987eb
# ╠═015451b5-3ae3-4f1f-a82c-9086b00a0373
# ╟─31e3cb2e-ad7e-43f8-bcb6-cccea07653b8
# ╟─3fdf97a9-446c-41c9-8192-b08488f31e9e
# ╟─5737405f-7ced-403c-b49f-f8159f95a4e8
