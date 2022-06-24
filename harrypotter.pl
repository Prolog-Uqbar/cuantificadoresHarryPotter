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
mago(dumbledore).


usa(harry,capaInvisibilidad,3).
usa(harry,capaInvisibilidad,1).
usa(harry,inmobilus,1).
usa(harry,avadaKedavra,7).
usa(harry,multijugo,3).
usa(snape,multijugo,5).
usa(snape,capaInvisibilidad,4).
usa(snape,suerteLiquida,4).
usa(snape,deshacerHechizo,4).
usa(hermione,multijugo,3).
%usa(hermione,sectumSempra,3).
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

hechizoImperdible(Hechizo):-
    hechizo(Hechizo,_),
    not(hayUnMagoQueSeLoPierde(Hechizo)).

hayUnMagoQueSeLoPierde(Hechizo):-
    mago(Mago),
    not(usa(Mago,Hechizo,_)).

hechizoPopular(Hechizo):-
    hechizo(Hechizo,_),
    forall(mago(Mago),usa(Mago,Hechizo,_)).


soloUsaPociones1(Mago):-
    mago(Mago), 
    not(usaHechizo(Mago,_)), 
    not((objetoMagico(ObjetoMagico),usa(Mago,ObjetoMagico,_))).

soloUsaPociones2(Mago):-
    mago(Mago), 
    not((usa(Mago,Algo,_), not(pocion(Algo,_,_)))). 

soloUsaPociones3(Mago):-
    mago(Mago), 
    forall(usa(Mago,Algo,_),pocion(Algo,_,_)).

especialistaEnPociones(Mago):-
    mago(Mago), 
    forall(pocion(Algo,_,_), usa(Mago,Algo,_)).
