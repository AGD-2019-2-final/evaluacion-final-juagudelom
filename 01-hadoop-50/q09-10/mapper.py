import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<

if __name__ == "__main__":
	for line in sys.stdin:
		lett=line.split('   ')[0]
		date=line.split('   ')[1]
		num=line.split('   ')[2]
		num=int(num)
		numentero=str(num).zfill(5)

		sys.stdout.write("{}\t{}\t{}\t{}\n".format(numentero, lett, date, num))
