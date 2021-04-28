***********Creation des tables*************

	create table CLIENTS (
    numPass SERIAL PRIMARY KEY,
    nom varchar(50) unique NOT NULL,
    ville varchar(50) NOT NULL
)

	
	

|
|
|
|
|
|

		create table CHAMBRES (
    numC SERIAL PRIMARY KEY,
    lits integer default 2,
    prix float NOT NULL
)
|
|
|
|
|
|
		 CREATE TABLE RESERVATIONS(
			numR NUMERIC(20) PRIMARY KEY, 
			numPass VARCHAR(20),
			numC NUMERIC(20) NOT NULL,
			arrivée date NOT NULL,
			départ date
			CONSTRAINT fk_RESERVATIONS FOREIGN KEY(numPass) REFERENCES CLIENTS(numPass) ON DELETE CASCADE ON UPDATE CASCADE,
			CONSTRAINT fk_CHAMBRES FOREIGN KEY(numC) REFERENCES CHAMBRES(numC) ON DELETE CASCADE ON UPDATE CASCADE

 );
	
	***********Remplissage des tables*************
	
	
				-----Insertion des clients-----

			INSERT INTO public.clients(numpass, nom, ville)VALUES (23,'Zainab','Safi');
 			INSERT INTO public.clients(numpass, nom, ville)VALUES (223,'Bouchra','casa');
			INSERT INTO public.clients(numpass, nom, ville)VALUES (4523,'laila','Safi');
	
|
|
|
|
|
|

				-----Insertion des CHAMBRES-----

			INSERT INTO public.chambres(numc, prix)VALUES (1,2,100);	
			INSERT INTO public.chambres(numc, prix)VALUES (2,2,200);
			INSERT INTO public.chambres(numc, prix)VALUES (3,2,300);


|
|
|
|
|
|

				--------Insertion des Reservations-----------


			INSERT INTO public.reservations(numr, numpass, numc, "départ")VALUES (2832, 23, 1,'24/06/2021');
			INSERT INTO public.reservations(numr, numpass, numc, "départ")VALUES (332, 223, 2,'22/08/2021');
			INSERT INTO public.reservations(numr, numpass, numc, "départ")VALUES (432, 223, 3,'22/08/2021');
			INSERT INTO public.reservations(numr, numpass, numc, "départ")VALUES (22832, 23, 1,'24/06/2020');
			INSERT INTO public.reservations(numr, numpass, numc, "départ")VALUES (2332, 223, 2,'22/08/2020');
			INSERT INTO public.reservations(numr, numpass, numc, "départ")VALUES (4232, 223, 3,'22/08/2020');

				***********Function***************



----fonction qui affiche les chambres réservées pendant le mois d'Août dernier-----














----- fonction qui affiche les client qui ont reservé les chambres quit coûtent plus de 700 dhs-----





-----fonction qui affiche les chambres reservées par les clients dont les noms commecent par A----



CREATE OR REPLACE FUNCTION public.clientnoma(
	)
    RETURNS TABLE(numc numeric, lits numeric, prix numeric) 
    LANGUAGE 'plpgsql'
   BEGIN
    RETURN QUERY SELECT
     ch.*
    FROM
     chambres AS ch,reservations AS r,clients AS cl
     WHERE ch.numC=r.numC AND r.numPass = cl.numPass AND cl.nom Like'A%'
	 GROUP BY ch.numC;
END; 






-----une fonction qui affiche les clients qui ont réservés plus de 2 chambres----



CREATE OR REPLACE FUNCTION public.reservechambre8(
	)

BEGIN
    RETURN QUERY SELECT
     ch.*
    FROM
     chambres AS ch,reservations AS r
     WHERE ch.numC=r.numC AND EXTRACT(MONTH FROM r.arrivee)=8
	 GROUP BY ch.numC;
END;






-----une fonction qui affiche les clients qui habitent à Casablanca et qui on passé plus de 2 réservations ont réservés plus de 2 chambres-----



				***************PROCEDURE**************
				
				
				
--------une procédure qui permet de modifer le prix des chambres qui des prix supérieurs à 700dhs par 1000dhs-----------

---------une procédure qui permet de supprimer les clients qui n'ont passé des réservations------------

CREATE OR REPLACE PROCEDURE public.supprimerclient(
	)
LANGUAGE 'plpgsql'
AS $BODY$
begin
    delete from "clients" WHERE clients.numPass Not in(select numPass FROM reservations );
end;
$BODY$;



---------une procédure qui permet d'ajouter 100dhs pour les chambres qui ont plus de 2 lits---------


create or replace procedure Ajout100dhLits()
language plpgsql    
as $updatePrix$
begin
    update chambres 
    set prix = prix + 100
    where lits > 2;
end;$updatePrix$


































