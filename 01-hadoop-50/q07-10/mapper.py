import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<

if __name__ == "__main__":
    for line in sys.stdin:
        primero = line.split('   ')[0]
        segundo = line.split('   ')[1]
        tercero = int(line.split('   ')[2])
        tercerof = "{:03.0f}".format(tercero)
        
        sys.stdout.write("{}\t{}\t{}\t{}\n".format(primero,tercerof,segundo,tercero))
