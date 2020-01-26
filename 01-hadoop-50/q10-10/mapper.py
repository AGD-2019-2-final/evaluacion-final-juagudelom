import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<

if __name__ == "__main__":
	for line in sys.stdin:
		num = int(line.split('\t')[0])
		numf = "{:03.0f}".format(num)
		lett = line.split('\t')[1]
		lett = lett.rstrip('\r\n')
		lett_ = lett.split(',')
		for i in range(len(lett)):
			sys.stdout.write("{}\t{}\n".format(str(lett[i]),numf))
        