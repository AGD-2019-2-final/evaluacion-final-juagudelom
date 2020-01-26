import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<

if __name__ == '__main__':

    ckey = None
    ctotal = 0


    for line in sys.stdin:

        clave, valor = line.split("\t")
        valor = int(valor)

        if clave == ckey:
        	ctotal += valor
        else:
            if ckey is not None:
                sys.stdout.write("{}\t{}\n".format(ckey, ctotal))

            ckey = clave
            ctotal = valor
    sys.stdout.write("{}\t{}\n".format(ckey, ctotal))
