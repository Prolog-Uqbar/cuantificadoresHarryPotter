pelicula(1,"HP y la piedra filosofal").

objetoMagico(varitaSauco).
objetoMagico(boletoHogwart).
objetoMagico(capaInvisibilidad).

hechizo(inmobilus, facil).
hechizo(avadaKedavra, imperdonable).
hechizo(sectumSempra, dificil).

pocion(multijugo,pelo,4).
pocion(deshacerHechizo,mandragora,30).
pocion(suerteLiquida,trebol,5).

mago(harry).
mago(hermione).
mago(snape).

usa(harry,capaInvisibilidad,3).
usa(harry,capaInvisibilidad,1).
usa(harry,inmobilus,1).
usa(harry,avadaKedavra,7).
usa(harry,multijugo,3).
usa(snape,multijugo,5).
usa(snape,inmobilus,5).
usa(hermione,multijugo,3).
usa(hermione,inmobilus,3).
usa(luke,inmobilus,3).

usaHechizo(Mago,Hechizo):-
   usa(Mago,Hechizo,_),
   hechizo(Hechizo,_),
   mago(Mago).

hechizoUtilizado(Hechizo):-
    usa(Mago,Hechizo,_),
    hechizo(Hechizo,_),
    mago(Mago).

hechizoOlvidado(Hechizo):-
    hechizo(Hechizo,_),
    not(hechizoUtilizado(Hechizo)).

hechizoImperdible(Hechizo).
hechizoPopular(Hechizo).
