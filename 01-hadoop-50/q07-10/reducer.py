import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<

if __name__ == '__main__':

    for line in sys.stdin:
        primero,segundo,tercero = line.split("\t")
        tercero=int(tercero)
        sys.stdout.write("{}   {}   {}\n".format(primero, segundo, tercero))
