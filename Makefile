all: OPENMP/kmeans SERIAL/kmeans

OPENMP/kmeans:
	cd kmeans_openmp; make
	
SERIAL/kmeans:
	cd kmeans_serial; make

stats:
	mkdir results -p
	./lick.sh data/100 > results/a_100
	./lick.sh data/204800.txt > results/a_2x
	./lick.sh data/819200.txt > results/a_8x
	./lick.sh data/kdd_cup > results/a_kdd

	./mlick.sh data/100 > results/m_100
	./mlick.sh data/204800.txt > results/m_2x
	./mlick.sh data/819200.txt > results/m_8x
	./mlick.sh data/kdd_cup > results/m_kdd


clean:
#	cd kmeans_serial; make clean
	cd kmeans_openmp; make clean
	
