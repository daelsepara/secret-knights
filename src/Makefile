all: clean
	zilf -w knights.zil
	zapf -ab knights.zap > knights_freq.xzap
	rm knights_freq.zap
	zapf knights.zap

test: clean
	zilf -w knights.zil
	zapf knights.zap

clean:
	rm -f *.xzap *.zap *.z?
