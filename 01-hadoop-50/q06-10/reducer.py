import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<

if __name__ == '__main__':

    ckey = None
    total = 0
    totmin = 0

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        clave, valor = line.split('\t')
        #valor = int(valor)

        if clave == ckey:
        	total = max(valor, total)
        	totmin = min(valor, totmin)
        else:
            if ckey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(ckey, total, totmin))

            ckey = clave
            total = valor
            totmin = valor

    sys.stdout.write("{}\t{}\t{}\n".format(ckey, total, totmin))
