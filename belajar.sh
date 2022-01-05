#!/datia/data/com.termux/files/usr/bin/env bash

# Buat warna
source utils/colors.sh

# Baca semua script bab
for i in $(ls bab); do
	source bab/$i
done

intro() {
	echo "${RST}${BLD}Ketik ${CYAN}cat belajar.txt${RST}"
	read -p "${RST}${GREEN}~${RST} $ " cmd arg
	if [ "$cmd" = "cat" ] && [ "$arg" = "belajar.txt" ]; then
		cat belajar.txt
		echo -n "${RST}${GREEN}~${RST} $ "
		sleep 2 && echo
		intro_less
	else
		echo "Maaf! Mohon coba lagi!"
		intro
	fi
}

intro_less() {
	echo "${RST}${BLD}Sekarang, Ketik ${CYAN}less mulai.txt${RST}"
	read -p "${RST}${GREEN}~${RST} $ " cmd arg
	if [ "$cmd" = "less" ] && [ "$arg" = "mulai.txt" ]; then
		less mulai.txt
		echo -n "${RST}${GREEN}~${RST} $ "
		sleep 2 && echo
		pilih_bab
	else
		echo "Maaf! Mohon coba lagi!"
		intro_less
	fi
}

pilih_bab() {
	cat <<- EOF
	${RST}${BLD}Silahkan pilih bab yang akan dipelajari${RST}
	1. Bab 1  -  Introduksi, Basis, Membuat, Membaca, dan menghapus file atau folder 
	2. Bab 2  -  Fitur Termux
	3. Bab 3  -  Package Manager, dan Mendownload file
	4. Bab 4  -  Memutar Lagu

	Atau tekan ${RST}${BLD}CTRL + C${RST} untuk keluar
	EOF

	read -p "Pilih Bab yang akan dipelajari (Dengan nomor): " bab
	if ! [ -f bab/$bab.sh ]; then
		echo "Maaf, Input tidak valid"
		pilih_bab
	else if [ "$bab" = "bab" ]; then
		echo "Maksud kami, Pilih bab yang akan dipelajari dengan menekan nomor kemudian enter. Contohnya, Bab 1, Ketik 1 lalu enter"
		pilih_bab
	else
		bab${bab}
	fi fi
}

intro
