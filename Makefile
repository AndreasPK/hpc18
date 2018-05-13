all: OPENMP/kmeans SERIAL/kmeans

OPENMP/kmeans:
	cd kmeans_openmp; make
	
SERIAL/kmeans:
	cd kmeans_serial; make

stats:
	mkdir results3 -p
	./lick.sh data/100 > results3/a_100
	./lick.sh data/204800.txt > results3/a_2x
	./lick.sh data/819200.txt > results3/a_8x
	./lick.sh data/kdd_cup > results3/a_kdd

	./mlick.sh data/100 > results3/m_100
	./mlick.sh data/204800.txt > results3/m_2x
	./mlick.sh data/819200.txt > results3/m_8x
	./mlick.sh data/kdd_cup > results3/m_kdd


clean:
#	cd kmeans_serial; make clean
	cd kmeans_openmp; make clean
	
