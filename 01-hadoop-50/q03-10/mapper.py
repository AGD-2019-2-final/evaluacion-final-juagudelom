import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<

if __name__ == "__main__":
	for line in sys.stdin:
		let=line.split(',')[0]
		num=line.split(',')[1]
		num=int(num)
		sys.stdout.write("{}\t{}\t{}\n".format(num, let, num))
