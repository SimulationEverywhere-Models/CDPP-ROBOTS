% ROBOTS MODEL
% by Javier Ameghino jameghin@dc.uba.ar
% 08/22/2000

[top]
components : Planta Fuente1@Generator Fuente2@Generator Fuente3@Generator Fuente4@Generator
link : out@Fuente1 in1@Planta
link : out@Fuente2 in2@Planta
link : out@Fuente3 in3@Planta
link : out@Fuente4 in4@Planta

[Fuente1]
distribution : poisson
mean : 7
initial : 1
increment : 0

[Fuente2]
distribution : poisson
mean : 9
initial : 1
increment : 0

[Fuente3]
distribution : poisson
mean : 15
initial : 1
increment : 0

[Fuente4]
distribution : poisson
mean : 20
initial : 1
increment : 0

[Planta]
type : cell
dim : (20,20)
delay : inertial
defaultDelayTime : 1000
border : nowrapped
neighbors :               Planta(-1,0)
neighbors : Planta(0,-1)  Planta(0,0)  Planta(0,1)
neighbors :               Planta(1,0)
initialValue : 0
in : in1 in2 in3 in4
link : in1 in@Planta(12,19)
link : in2 in@Planta(0,10)
link : in3 in@Planta(9,0)
link : in4 in@Planta(19,6)
localtransition : RobotsMov
portInTransition : in@Planta(12,19) GenRobot1
portInTransition : in@Planta(0,10) GenRobot2
portInTransition : in@Planta(9,0) GenRobot3
portInTransition : in@Planta(19,6) GenRobot4

[RobotsMov]
% ------ Robot 1 ------------------------------------
rule : 10 1000 {(0,1)=1 and (0,0)=0 and cellpos(1)!=4}
rule : 11 1000 {(0,1)=1 and (0,0)=0 and cellpos(1)=4}
rule : 0 0 {(0,-1)=10 and (0,0)=1}
rule : 0 0 {(0,-1)=11 and (0,0)=1}
rule : 2 0 {(0,0)=11}
rule : 1 0 {(0,0)=10}

rule : 20 2000 {(-1,0)=2 and (0,0)=0 and cellpos(0)!=17}
rule : 21 2000 {(-1,0)=2 and (0,0)=0 and cellpos(0)=17}
rule : 0 0 {(1,0)=20 and (0,0)=2}
rule : 0 0 {(1,0)=21 and (0,0)=2}
rule : 2 0 { (0,0)=20 }
rule : 1 0 { (0,0)=21 }

% ------ Robot 2 ------------------------------------
rule : 30 1000 {(0,1)=3 and (0,0)=0 and cellpos(1)!=4}
rule : 31 1000 {(0,1)=3 and (0,0)=0 and cellpos(1)=4}
rule : 0 0 {(0,-1)=30 and (0,0)=3}
rule : 0 0 {(0,-1)=31 and (0,0)=3}
rule : 4 0 {(0,0)=31}
rule : 3 0 {(0,0)=30}

rule : 40 2000 {(-1,0)=4 and (0,0)=0 and cellpos(0)!=17}
rule : 41 2000 {(-1,0)=4 and (0,0)=0 and cellpos(0)=17}
rule : 0 0 {(1,0)=40 and (0,0)=4}
rule : 0 0 {(1,0)=41 and (0,0)=4}
rule : 4 0 { (0,0)=40 }
rule : 3 0 { (0,0)=41 }

% ------ Robot 3 ------------------------------------
rule : 50 1000 {(0,-1)=5 and (0,0)=0 and cellpos(1)!=12}
rule : 51 1000 {(0,-1)=5 and (0,0)=0 and cellpos(1)=12}
rule : 0 0 {(0,1)=50 and (0,0)=5}
rule : 0 0 {(0,1)=51 and (0,0)=5}
rule : 6 0 {(0,0)=51}
rule : 5 0 {(0,0)=50}

rule : 60 2000 {(1,0)=6 and (0,0)=0 and cellpos(0)!=5}
rule : 61 2000 {(1,0)=6 and (0,0)=0 and cellpos(0)=5}
rule : 0 0 {(-1,0)=60 and (0,0)=6}
rule : 0 0 {(-1,0)=61 and (0,0)=6}
rule : 6 0 { (0,0)=60 }
rule : 5 0 { (0,0)=61 }

% ------ Robot 4 ------------------------------------
rule : 70 1000 {(0,-1)=7 and (0,0)=0 and cellpos(1)!=12}
rule : 71 1000 {(0,-1)=7 and (0,0)=0 and cellpos(1)=12}
rule : 0 0 {(0,1)=70 and (0,0)=7}
rule : 0 0 {(0,1)=71 and (0,0)=7}
rule : 8 0 {(0,0)=71}
rule : 7 0 {(0,0)=70}

rule : 80 2000 {(1,0)=8 and (0,0)=0 and cellpos(0)!=5}
rule : 81 2000 {(1,0)=8 and (0,0)=0 and cellpos(0)=5}
rule : 0 0 {(-1,0)=80 and (0,0)=8}
rule : 0 0 {(-1,0)=81 and (0,0)=8}
rule : 8 0 { (0,0)=80 }
rule : 7 0 { (0,0)=81 }

% ---------------------------------------------------
rule : 0 50 {((0,0)=1 or (0,0)=3) and (0,-1)=?}
rule : 0 50 {((0,0)=2 or (0,0)=4) and (1,0)=?}
rule : 0 50 {((0,0)=5 or (0,0)=7) and (0,1)=?}
rule : 0 50 {((0,0)=6 or (0,0)=8) and (-1,0)=?}
rule : {(0,0)} 0 {t}

[GenRobot1]
rule : 1 0 { t }

[GenRobot2]
rule : 4 0 { t }

[GenRobot3]
rule : 5 0 { t }

[GenRobot4]
rule : 8 0 { t }
