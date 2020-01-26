import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<

if __name__ == '__main__':

    ckey = None
    total = 0

    for line in sys.stdin:
        key, valor = line.split("\t")
        valor = int(valor)

        if key == ckey:
        	total = max(valor,total)
        else:
            if ckey is not None:
                sys.stdout.write("{}\t{}\n".format(ckey, total))

            ckey = key
            total = valor
    sys.stdout.write("{}\t{}\n".format(ckey, total))
