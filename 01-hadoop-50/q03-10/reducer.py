import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<

if __name__ == '__main__':

    ckey = None
    total = 0

    for line in sys.stdin:

        valor, clave, valor = line.split("\t")
        valor = int(valor)

        if clave == ckey:
        	total += valor
        else:
            if ckey is not None:
                sys.stdout.write("{},{}\n".format(ckey, total))

            ckey = clave
            total = valor

    sys.stdout.write("{},{}\n".format(ckey, total))
