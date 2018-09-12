universe u

inductive movimento: Type
| direita  : movimento
| esquerda : movimento
| parado   : movimento

structure configuracao : Type := mk :: 
(estAtual: int) --
(simboloLer: nat)
(simboloEsc: nat)
(mov: movimento)
(proxEst: int)

def confInvalida: configuracao := 
configuracao.mk 0 0 0 sorry 0

structure fita : Type := mk ::
(anterior: list nat)
(proximo: list nat)
(atual: list nat)

structure MdT : Type := mk :: 
(transicoes: list configuracao)
(simbolos: list nat) -- 0, 1 para escrita e 2 para representar o vazio. 
(estInicial: int) -- Estado permitidos: ≥ 0; Estado de erro: -1. 
(isEstFinal: int -> bool) --
(proxEst: int -> nat -> int) -- Pega um estado mais um simbolo e leva em outro estado.

def is_equal : list char → list char → bool
| []        []        := tt
| (x :: xs) []        := ff
| []        (y :: ys) := ff 
| (x :: xs) (y :: ys) := (x = y) && is_equal xs ys

def find_int (x : int) : list int -> option int
| [] := none
| (y :: ys) :=
if x = y then return 0
else do r <- find_int ys, return (r + 1)

def find_int_in_conf (x : int) : list configuracao -> option int
| [] := none 
| (y :: ys) :=
if x = y.estAtual then return x
else do r <- find_int_in_conf ys, return (r + 1)

def checaSimbolo (simboloEsp: nat) (simboloLido: nat) (proxEst: int) : int :=
if(simboloLido = simboloEsp) then proxEst
else -1 -- Leu um símbolo que não era o símbolo esperado para o estado atual? Erro produzido.

def procuraConf (maquina: MdT): configuracao := -- Talvez possa usar só find int_in_conf
if((find_int_in_conf maquina.estInicial maquina.transicoes) = maquina.estInicial) then sorry
else confInvalida

def checaEstado (maquina: MdT) (tape: fita): int :=
let conftemp := configuracao in procuraConf maquina

if((checaSimbolo (conftemp.simboloLer)(tape.atual)(conftemp.proxEst)) = (-1)) then -1 -- Cheguei num estado aonde o simbolo lido nao é  o simbolo esperado para o estado. Quit
else
if     

--def avalia

-- def visualizaFita 