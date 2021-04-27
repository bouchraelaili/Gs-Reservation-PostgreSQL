***********Creation des tables*************

		CREATE table Client(
			nom varchar(50) unique,
			numPass varchar(50),
			ville varchar(50)
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

			INSERT INTO clients VALUES('LSL', 'Bouchra', 'Safi');
			INSERT INTO clients VALUES('lalf', 'laila', 'safi');
			INSERT INTO clients VALUES('kdk', 'zainab', 'casa')

|
|
|
|
|
|

				-----Insertion des CHAMBRES-----

			INSERT INTO chambres VALUES (132,13,100);
			INSERT INTO chambres VALUES (245,294,600);
			INSERT INTO chambres VALUES (369,349,200);


|
|
|
|
|
|

				--------Insertion des Reservations-----------


			INSERT INTO reservations VALUES (1, 'LSL', 132, '2021-04-01', '2021-04-30');
			INSERT INTO reservations VALUES (2, 'lalf', 245, '2021-05-01', '2021-05-30');
			INSERT INTO reservations VALUES (3, 'kdk', 369, '2021-06-01', '2021-06-30');




				***********Function***************



----fonction qui affiche les chambres réservées pendant le mois d'Août dernier-----

----- fonction qui affiche les client qui ont reservé les chambres quit coûtent plus de 700 dhs-----

-----fonction qui affiche les chambres reservées par les clients dont les noms commecent par A----

-----une fonction qui affiche les clients qui ont réservés plus de 2 chambres----

-----une fonction qui affiche les clients qui habitent à Casablanca et qui on passé plus de 2 réservations ont réservés plus de 2 chambres-----



				***************PROCEDURE**************
				
				
				
--------une procédure qui permet de modifer le prix des chambres qui des prix supérieurs à 700dhs par 1000dhs-----------

---------une procédure qui permet de supprimer les clients qui n'ont passé des réservations------------

---------une procédure qui permet d'ajouter 100dhs pour les chambres qui ont plus de 2 lits---------


































