import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<

if __name__ == '__main__':

    ckey = None
    total = 0
    prom = 0
    p=0

    for line in sys.stdin:

        clave, valor = line.split("\t")
        valor = float(valor)

        if clave == ckey:
        	total = total + valor
        	p += 1
        	prom = total/p

        else:
            if ckey is None:
            	ckey=clave
            	total=valor
            	p = 1
            	prom = total/p

            else:
                sys.stdout.write("{}\t{}\t{}\n".format(ckey, total, prom))
                ckey = clave
                total = valor
                p = 1
                prom = total/p
    sys.stdout.write("{}\t{}\t{}\n".format(ckey, total, prom))
