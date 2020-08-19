@echo off

del *.xzap *.zap *.z?
zilf -w knights.zil
zapf -ab knights.zap > knights_freq.xzap
del knights_freq.zap
zapf knights.zap
