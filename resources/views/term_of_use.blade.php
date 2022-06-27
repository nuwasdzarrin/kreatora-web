@extends('layouts.vue_app')

@section('content')
    <style>
        .top-navbar-block-title {
            font-style: normal;
            font-weight: 700;
            font-size: 20px;
            line-height: 140%;
            color: #001B29;
        }
        .font-title {
            font-weight: 600;
        }
    </style>
    <div style="max-width: 480px;margin: 0 auto;height: 100vh;">
        <div class="container bg-white" style="box-shadow: 0 2px 2px rgba(0, 0, 0, 0.15);">
            <div class="d-flex align-items-center py-3 text-14">
                <a href="/campaign"
                     style="cursor: pointer;">
                    <i class="fas fa-arrow-left" style="color: #008FD7;font-size: 20px;"></i>
                </a>
                <div class="top-navbar-block-title ml-3">Kebijakan Pengguna</div>
            </div>
        </div>
        <div class="container mt-4 pb-3 text-dark">
            <div class="mb-4">
                <h5 class="font-title">A. Pengguna</h5>
                <p class="text-justify">Pengguna merupakan orang atau organisasi yang telah mendaftarkan diri dan atau
                    menggunakan layanan Kreatora. Pengguna yang dimaksud adalah backer dan kreator</p>
            </div>
            <div class="mb-4">
                <h5 class="font-title">B. Kreator</h5>
                <p class="text-justify">Kreator adalah orang atau organisasi yang sudah melakukan verifikasi identitas untuk
                    selanjutnya dapat membuat campaign untuk mendapatkan pendanaan dari backer dan memberikan reward yang telah
                    dijanjikan.</p>
            </div>
            <div class="mb-4">
                <h5 class="font-title">C. Campaign</h5>
                <p class="text-justify">Campaign adalah karya yang dibuat oleh kreator yang ditampilkan pada platform Kreatora.
                    Karya yang dibuat harus bersifat original dan benar-benar milik kreator. Kreator bertanggungjawab penuh atas
                    campaign yang dibuat. Apabila terdapat kecurangan, pelanggaran, dan atau kondisi yang tidak normal, maka
                    Kreatora berhak untuk menghapus campaign tersebut.</p>
            </div>
            <div class="mb-4">
                <h5 class="font-title">D. Backer</h5>
                <p class="text-justify">Backer adalah pengguna yang telah melakukan dukungan pada suatu campaign. Backer harus
                    menyediakan identitas diri yang asli dan tidak boleh memakai identitas orang lain. Kreatora mengidentifikasi
                    backer berdasarkan data yang telah diisi secara mandiri pada saat pembuatan akun. Kreatora berhak menghapus
                    akun backer yang dinilai melanggar hukum, norma dan adat istiadat.</p>
            </div>
            <div class="mb-4">
                <h5 class="font-title">E. Pembuatan Akun</h5>
                <p class="text-justify">Pengguna bertanggungjawab penuh terhadap akitivitas yang digunakan pada akun yang telah
                    dibuat. Pengguna tidak boleh untuk menyamar sebagai orang lain. Pengguna tidak boleh untuk memakai nama yang
                    menyinggung orang lain atau organisasi lain. Jika pengguna melanggar ketentuan dari Kreatora, maka Kreatora
                    berhak untuk menghapus akun yang sudah dibuat.</p>
            </div>
            <div class="mb-4">
                <h5 class="font-title">F. Larangan</h5>
                <div class="text-justify">
                    <p class="mb-1">Pengguna tidak diperbolehkan untuk melakukan hal-hal berikut:</p>
                    <ol class="pl-3">
                        <li class="mb-2">Melakukan kegiatan pelanggaran hukum</li>
                        <li class="mb-2">Melakukan penipuan tekait dan atau tidak terkait pada campaign yang akan atau telah
                            diterbitkan </li>
                        <li class="mb-2">Melakukan tindakan yang melanggar norma seperti penyebaran pornografi, menyinggung agama,
                            dan adat istiadat</li>
                        <li class="mb-2">Melakukan tindakan yang melanggar hak asasi manusia, termasuk memperdaya, mempermalukan,
                            dan mengancam</li>
                        <li class="mb-2">Melakukan peretasan atau mencelakai komputer pengguna lain, termasuk memasukkan virus,
                            atau program berbahaya lainnya yang menyebabkan kompononen perangkat lunak, dan atau perangkat keras rusak
                            dan atau atau melakukan pencurian data</li>
                        <li class="mb-2">Menyalahgunakan data pribadi pengguna untuk kejahatan atau tindakan yang melanggar norma
                            dan adat istiadat</li>
                    </ol>
                </div>
            </div>
            <div class="mb-4">
                <h5 class="font-title">G. Hal Terkait Pendanaan</h5>
                <div class="text-justify">
                    <p class="mb-1">Pengguna perlu memahami hal – hal berikut terkait pendanaan di platform Kreatora.</p>
                    <h5 class="my-2 font-title">Kreator dan campaign</h5>
                    <ol class="pl-3">
                        <li class="mb-2">Kreator bertanggungjawab penuh atas campaign yang dibuat</li>
                        <li class="mb-2">Pendanaan yang dihasilkan dari campaign diberikan setelah campaign berhasil</li>
                        <li class="mb-2">Beberapa dukungan dari backer mungkin tidak dapat diproses karena terjadi kendala pada
                            pembayaran yang dilakukan oleh backer</li>
                        <li class="mb-2">Mungkin ada kendala pada proses pencairan dana yang terjadi karena masalah teknis atau
                            terjadi masalah pada campaign yang telah terdanai, termasuk pelanggaran atau aktivitas mencurigakan.</li>
                        <li class="mb-2">Kreatora mengenakan biaya platform sebesar 5% dan fee dari pihak ketiga yang sedang bekerja
                            sama dengan Kreatora terkait pencairan dana ketika kreator melakukan pencairan dana</li>
                        <li class="mb-2">Nominal dukungan yang diterima dari backer adalah nominal dukungan dikurangi administrasi
                            pembayaran payment gateway yang dipakai oleh Kreatora</li>
                        <li class="mb-2">Kreator bertanggungjawab penuh atas dukungan yang diterima dari backer</li>
                        <li class="mb-2">Kreatora berhak menbatalkan pencairan dana jika kreator melanggar ketentuan</li>
                        <li class="mb-2">Kreator memiliki hak untuk menghubungi backer terkait reward yang akan diberikan</li>
                    </ol>
                    <h5 class="my-2 font-title">Backer dan campaign</h5>
                    <ol class="pl-3">
                        <li class="mb-2">Nominal dukungan yang berikan pada kreator adalah nominal dukungan dikurangi administrasi
                            pembayaran payment gateway yang dipakai oleh Kreatora</li>
                        <li class="mb-2">Estimasi waktu pemberian reward adalah estimasi dari kreator yang merupakan tanggung jawab
                            dari kreator</li>
                        <li class="mb-2">Backer memiliki hak untuk menghubungi kreator terkait reward yang akan diberikan</li>
                    </ol>
                </div>
            </div>
            <div class="mb-4">
                <h5 class="font-title">H. Resiko</h5>
                <div class="text-justify">
                    <p class="mb-1">Berikut adalah beberapa resiko yang perlu diperhatikan</p>
                    <ol class="pl-3">
                        <li class="mb-2">Kreatora tidak bertanggung jawab pada performa campaign, dan tidak berkewajiban untuk
                            melakukan mediasi terkait masalah pada campaign.</li>
                        <li class="mb-2">Kesalahan teknis dan non teknis terhadap pihak ketiga berada diluar tanggung jawab kreatora
                            dan merupakan sepenuhnya tanggung jawab pihak ketiga. </li>
                        <li class="mb-2">Ketika pengguna memutuskan untuk membuat link yang disediakan oleh kreator pada campaign,
                            dan keluar dari platform Kreatora, maka hal-hal yang terjadi adalah bukan tanggung jawab Kreatora.</li>
                    </ol>
                </div>
            </div>
            <div class="mb-4">
                <h5 class="font-title">I. Hak Kekayaan Intelektual</h5>
                <div class="text-justify">
                    <p class="mb-1">Hak kekayaan intelektual terhadap karya pada campaign adalah milik kreator. Namun Kreatora
                        berhak untuk menggunakan atau menggandakannya. Penggunaan terhadap karya meliputi</p>
                    <ol class="pl-3">
                        <li class="mb-2">Menampilkan dan mempromosikan karya, tidak terikat dengan waktu, tempat dan fee</li>
                        <li class="mb-2">Melakukan edit atau modifikasi seperti melakukan translasi, dan atau mengubah format</li>
                    </ol>
                    <p class="mb-1">Hal yang perlu diperhatikan terkait kekayaan intelektual pada karya adalah</p>
                    <ol class="pl-3">
                        <li class="mb-2">Kreator bertanggung jawab terhadap karya termasuk pada royalti pada pihak lain, informasi,
                            dan hal lain terkait karya</li>
                        <li class="mb-2">Kreator bertanggung jawab terhadap kesalahan yang terjadi pada karyanya</li>
                    </ol>
                    <p class="mb-1">Hal yang perlu diperhatikan terkait kekayaan intelektual pada Kreatora</p>
                    <ol class="pl-3">
                        <li class="mb-2">Pengguna setuju untuk menghormati hak kekayaan intelektual yang dimiliki oleh Kreatora
                            seperti copyright, trademarks, sevice marks, patent, trade sevret dan kekayaan intelektual lainnya.</li>
                        <li class="mb-2">Kekayaan intelektual Kreatora dapat digunakan oleh pengguna untuk keperluan pribadi.
                            Apabila ingin digunakan untuk ketentuan komersial, maka pengguna perlu mengajukan izin terlebih dahulu
                        </li>
                    </ol>
                </div>
            </div>
            <div class="mb-4">
                <h5 class="font-title">J. Persetujuan</h5>
                <p class="text-justify">Pengguna dianggap telah menyetujui ketentuan dari Kreatora ketika menggunakan platform
                    Kreatora. Pengguna yang tidak setuju dengan ketentuan Kreatora tidak diperkenankan untuk menggunakan layanan
                    platform Kreatora</p>
            </div>
        </div>
    </div>
@endsection
