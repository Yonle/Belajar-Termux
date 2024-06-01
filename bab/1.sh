#!/usr/bin/env bash

source utils/colors.sh
HEAD="${RST}${BLD}1. Introduksi${RST}"

sethead() {
	HEAD="${RST}${BLD}${@}${RST}"
}

bab1() {
	clear
	cat <<- EOF
	${HEAD}

	${RST}${BLD}Termux${RST} adalah sebuah ${RST}${BLD}Terminal${RST} emulator yang digunakan
	untuk menjalankan beberapa program linux seperti
	nano, apt, bash, curl, ssh, dan lain lain.
	
	${RST}${BLD}Termux${RST} juga dipakai untuk beberapa kebutuhan tertentu,
	Mulai dari mengoding, Memutar musik, Menjalankan server,
	Mengedit kode, Chatting, Remoting, dan sebagainya.

	Termux juga bisa digunakan untuk menjalankan beberapa program
	Seperti clang, python, perl, nodejs, java, dan sebagainya.
	
	EOF

	read -p "Selanjutnya (Tekan Enter):"
	bab1_2
}

bab1_2() {
	clear
	echo -e "${HEAD}\n"

	echo "${RST}${BLD}Termux${RST} juga memakai ${RST}${BLD}Bash${RST} untuk terminalnya."
	echo -e "${RST}${BLD}Bash${RST} juga hampir digunakan di seluruh distribusi Linux.\n"
	read -p "Selanjutnya (Tekan Enter):"
	bab1_3
}

bab1_3() {
	sethead "2. Melihat isi folder"
	mkdir -p ${TMPDIR:-/tmp}/beltermux-tmpfile
	cd ${TMPDIR:-/tmp}/beltermux-tmpfile

	# Buat beberapa file & folder

	# Buat folder
	for i in Music Documents Pictures Downloads; do
		mkdir -p $i
	done

	# Buat file contoh
	lorem="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
	echo $lorem > Tugas.txt
	echo $lorem > Documents/Nota.txt
	
	for i in Pictures/Image1.jpg Pictures/Image2.jpg Pictures/Image3.jpg Music/Music1.mp3 Music/Music2.mp3 Music/Music3.mp3; do
		! [ -f $i ] && touch $i
	done
	clear

	echo -e "${HEAD}\n"
	echo -e "Sekarang kita mulai dari mengecek isi direktori, \natau biasa kita sebut ${RST}${BLD}folder${RST}."
	echo -e "Kita akan memakai command ${RST}${CYAN}ls${RST} untuk lihat isi direktori.\n\n(Tekan Enter untuk mengeksekusi contoh)"
	read -p "${RST}${GREEN}~${RST} $ ls"
	ls
	echo -e "\nAnda bisa lihat, Beberapa diantaranya memiliki warna,\nYaitu Biru dan putih. Teks biru berarti Folder,\nSedangkan Teks putih merupakan file biasa.\n(Tekan Enter untuk melanjutkan)"
	read

	echo -e "\nSelain itu, Kita juga bisa melihat isi dari\nsatu sampai lima (atau lebih) nama direktori Yang diminta."
	echo -e "\nHal ini bisa dilakukan dengan mengeksekusi ${RST}${CYAN}ls${RST}\ndengan nama folder, Seperti contoh dibawah ini untuk\nmengecek folder bernama ${RST}${CYAN}Pictures${RST}:"
	read -p "${RST}${GREEN}~${RST} $ ls Pictures"
	ls Pictures

	echo -e "\nItulah contoh diatas yang baru kami tunjukkan."
	echo -e "\nPenting diingat bahwa ${CYAN}ls${RST} adalah command yang wajib"
	echo -e "Diingat akan Kegunaan dan cara memakainya.\n"
	read -p "(Tekan Enter untuk melanjutkan)"
	bab1_4
}

bab1_4() {
	sethead "Mari Mencoba!"
	clear
	echo -e "${HEAD}\n"
	echo -e "Waktunya Mencoba! Sekarang, Lihat daftar file\nbeserta foldernya Dengan mengeksekusi command ${RST}${GREEN}ls${RST}\n"
	read -p "${RST}${GREEN}~${RST} $ " cmd arg
	if [ "$cmd" = "ls" ] && [ -z "$arg" ]; then
		ls
		echo "${RST}${GREEN}~${RST} $ "
		echo "Kerja Bagus!"
		read -p "(Tekan Enter untuk melanjutkan)" && bab1_4_2
	else if [ -d "$arg" ]; then
		ls $arg
		[ "$?" != 0 ] && echo "Ayo Coba Lagi!" && sleep 2 && bab1_4
		echo -e "\nAnda Cerdas!"
		echo -e "Melakukan ${RST}${GREEN}ls${RST} dengan nama folder akan membuat daftar isi\nDari nama folder yang anda tuju. Lanjut Perjalanan!\n"
		read -p "(Tekan Enter untuk melanjutkan)"
		bab1_5
	else
		echo "Ayo Coba Lagi!" && read -p "(Tekan Enter untuk melanjutkan)" && bab1_4
	fi fi
}

bab1_4_2() {
	clear
	echo -e "${HEAD}\n"
	echo -e "Lihat daftar file beserta foldernya yang berada\nDi dalam folder ${RST}${GREEN}Documents${RST} dengan command ${RST}${CYAN}ls${RST}"
	read -p "${RST}${GREEN}~${RST} $ " cmd arg
	if [ "$cmd" = "ls" ] && [ "$arg" = "Documents" ] || [ "$arg" = "documents" ]; then
		ls Documents
		echo -e "\nSaya senang melihat anda menjadi berbakat"
		read -p "(Tekan Enter untuk melanjutkan)"
		bab1_5
	else echo "Ayo Coba Lagi!" && read -p "(Tekan Enter untuk melanjutkan)" && bab1_4_2
	fi
}

bab1_5() {
	sethead "3. Memasuki ke dalam Folder"
	clear
	echo -e "${HEAD}\n"
	echo -e "Biasanya, Para pengguna biasa masuk ke dalam folder\nDengan menekan nama/logo folder yang akan dituju."
	echo -e "\nBerbeda di ${RST}${BLD}Bash${RST}, dimana pengguna\nakan menggunakan command yang disebut sebagai ${RST}${GREEN}cd${RST}."
	echo -e "Command inilah yang digunakan untuk masuk / ganti\nFolder yang saat ini kita berada."
	echo -e "\nContoh untuk masuk ke Folder tertentu:"
	read -p "${RST}${GREEN}~${RST} $ cd Pictures"
	echo "${RST}${GREEN}~/Pictures${RST} $ "
	echo -e "\nAdapula Contoh Lain untuk pergi ke Folder lain:"
	read -p "${RST}${GREEN}~/Pictures${RST} $ cd /sdcard"
	echo -e "${RST}${GREEN}/sdcard${RST} $\n\nDan jika anda cek konten direktori yang baru saja masuk,\nMaka outputnya akan mengeluarkan isi dari folder yang\nanda baru saja masuk dengan command ${RST}${GREEN}ls${RST}."
	read -p "${RST}${GREEN}~/Pictures${RST} $ ls"
	ls Pictures
	echo -e "\nMeskipun begitu, Adapula cara untuk keluar dari folder"
	echo -e "Yang baru saja kita masuk. Caranya hanya perlu melakukan ${GREEN}cd ..${BLD}"
	read -p "${RST}${GREEN}~/Pictures${RST} $ cd .."
	echo "${RST}${GREEN}~${RST} $ "

	echo -e "\nDisitulah dimana command ${GREEN}cd${RST} dan ${GREEN}ls${RST} menjadi berguna."
	echo -e "Seperti biasa, Kedua command tersebut sangat penting"
	echo -e "terutama untuk mengecek / Masuk / Keluar dari folder.\n"
	read -p "(Tekan Enter untuk melanjutkan)"
	echo -e "\nWalaupun keduanya penting, PS1 juga sangat membantu"
	echo -e "agar kita bisa mengetahui di folder mana kita berada saat ini\n|\n|\nV"
	echo -e "${RST}${GREEN}~${RST} $\n"
	echo "Di Linux, ${GREEN}${BLD}~${RST} adalah folder HOME,"
	echo "Yang biasanya digunakan untuk menyimpan file-file penting.\n"

	read -p "(Tekan Enter untuk melanjutkan)"
	bab1_6
}

bab1_6() {
	sethead "Kita berhenti disini dulu, Kawan"
	clear
	echo -e "${HEAD}\n"
	echo "Script ini masih belum selesai, dan anda berada di akhir"
	echo "dari demonstrasi script tutorial ini. Jika ada masalah, Mohon"
	echo "Melaporkannya ke https://github.com/Yonle/Belajar-Termux/issues"
	echo -e "\nTerima kasih telah mencoba!"
	cd
}
