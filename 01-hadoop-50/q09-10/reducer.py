import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<

    for line in sys.stdin:
    	if cont < 6:
    		entero, clave, date, valor = line.split("\t")
    		valor=int(valor)
    		sys.stdout.write("{}\t{}\t{}\n".format(clave, date, valor))
    		cont += 1