import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<

if __name__ == '__main__':

    ckey = None
    total = 0

    for line in sys.stdin:
        clave, valor = line.split("\t")
        valor = int(valor)

        if clave == ckey:
            total = str(total) + ',' + str(valor) 
        else:
            if ckey is not None:
                if ckey !=',':
                    sys.stdout.write("{}\t{}\n".format(ckey, total))
            ckey = clave
            total =  int(valor)

    sys.stdout.write("{}\t{}\n".format(ckey, total))
