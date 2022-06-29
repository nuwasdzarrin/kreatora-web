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
                <div class="top-navbar-block-title ml-3">Kebijakan Privasi</div>
            </div>
        </div>
        <div class="container mt-4 pb-3 text-dark">
            <div class="mb-4">
                <h5 class="font-title">A. Persetujuan</h5>
                <p class="text-justify">Pengguna yang melakukan aktivitas di Kreatora seperti mengunjungi, mendaftar,
                    serta menggunakan platform Kreatora, menyatakan bahwa telah mengerti dan menyetujui semua ketentuan
                    Kreatora. Kebijakan privasi dapat diubah sewaktu-waktu dan merupakan bagian yang tak terpisahkan
                    dari kebijakan privasi. Apabila pengguna tidak menyetujui semua ketentuan kreatora maka tidak
                    diperkenankan untuk menggunakan platform Kreatora.</p>
            </div>
            <div class="mb-4">
                <h5 class="font-title">B. Pengumpulan data</h5>
                <p class="text-justify mb-1">Kreatora mengumpulkan data pengguna agar platform dapat digunakan dengan
                    semestinya, menunjang efisiensi kinerja, dan meningkatkan kualitas pelayanan. Data yang dikumpulkan
                    oleh Kreatora termasuk dan tidak terbatas pada data berikut:</p>
                <ol class="pl-3">
                    <li class="mb-2 text-justify">Data yang digunakan untuk menjadi pengguna pada platfrom Kreatora seperti nama,
                        email, dan password yang sudah di enkripsi</li>
                    <li class="mb-2 text-justify">Jika pengguna ingin membuat campaign maka Kreatora berhak untuk memverifikasi
                        identitas pengguna dengan melihat KTP, Akta perusahaan (Jika ada), NPWP (Jika ada) medial
                        sosial, dan nomor penjamin</li>
                    <li class="mb-2 text-justify">Detail dari segala jenis transaksi yang digunakan dalam fitur-fitur kami. Kreatora
                        bekerja sama dengan perusahaan lain seperti Midtrans untuk memproses fitur pembayaran, dan
                        informasi pembayaran yang anda masukkan akan kami simpan dan gunakan sesuai dengan kebijakan
                        privasi Midtrans</li>
                    <li class="mb-2 text-justify">Informasi tentang aktifitas anda terhadap website maupun aplikasi Kreatora,
                        termasuk jenis perangkat, IP address, jenis peramban, dan tindakan anda didalamnya</li>
                    <li class="mb-2 text-justify">Informasi yang anda masukkan ke dalam Kreatora dalam bentuk komentar, kontribusi,
                        diskusi, atau pesan ke pengguna lain</li>
                </ol>
                <p class="text-justify mb-1">Anda dapat dapat memilih untuk tidak memberikan informasi-informasi
                    tersebut kepada kami. Namun, ini akan membatasi kemampuan Anda untuk mendaftar akun atau
                    menggunakan layanan kami.</p>
            </div>
            <div class="mb-4">
                <h5 class="font-title">C. Tujuan pengumpulan data</h5>
                <p class="text-justify mb-1">Kami mengumpulkan informasi tersebut dengan tujuan sebagai berikut:</p>
                <ol class="pl-3">
                    <li class="mb-2 text-justify">Untuk menjaga keamanan akun Anda dan melindungi layanan kami (termasuk untuk
                        memverifikasi identitas kreator dan mencegah penipuan dan penyalahgunaan)</li>
                    <li class="mb-2 text-justify">Untuk memungkinkan kami menyediakan Layanan kami kepada Anda, dan untuk
                        meningkatkan dan mempromosikan Layanan kami</li>
                    <li class="mb-2 text-justify">Untuk meningkatkan pengalaman pengguna dalam menggunakan layanan kami (contohnya,
                        menentukan kreasi-kreasi terbaik yang sesuai dengan kriteria anda)</li>
                </ol>
            </div>
            <div class="mb-4">
                <h5 class="font-title">D. Bagaimana informasi ini digunakan dan dibagikan</h5>
                <p class="text-justify mb-1">Kreatora akan menggunakan dan menyimpan data berdasarkan ketentuan hukum
                    yang berlaku, kami juga tidak akan pernah menjual, menyebarkan, atau menyewakan data atau informasi
                    yang bersifat privat dalam bentuk apapun. Berikut adalah bagaimana kami membagikan data dan
                    informasi yang kami terima
                </p>
                <p class="text-justify mb-1">Informasi yang akan kami sebarkan secara publik:</p>
                <ol class="pl-3">
                    <li class="mb-2 text-justify">Gambar profil dan nama anda</li>
                    <li class="mb-2 text-justify">Proyek Kreasi yang anda buat dengan semua informasi yang ada di dalamnya</li>
                    <li class="mb-2 text-justify">Dukungan anda ke proyek-proyek yang anda dukung, kecuali jika anda memilih untuk
                        anonim</li>
                    <li class="mb-2 text-justify">Interaksi anda ke proyek yang anda dukung (contohnya komentar anda ke proyek
                        tersebut)</li>
                </ol>
                <p class="text-justify mb-1">Informasi yang bersifat rahasia:</p>
                <ol class="pl-3">
                    <li class="mb-2 text-justify">Password</li>
                    <li class="mb-2 text-justify">IP Address</li>
                    <li class="mb-2 text-justify">Nomor telepon</li>
                    <li class="mb-2 text-justify">Dokumen-dokumen yang anda kirimkan untuk memverifikasi sebagai kreator
                        (seperti KTP, NPWP, dll)</li>
                </ol>
                <p class="text-justify mb-1">Informasi yang dibagikan kepada pihak ketiga:</p>
                <p class="text-justify mb-1">Kami dapat membagikan informasi Anda dengan layanan pihak ketiga tepercaya
                    tertentu untuk membantu kami menyediakan, meningkatkan, mempromosikan, atau melindungi layanan
                    Kreatora (Contohnya kami memerlukan informasi untuk melakukan pembayaran dan membagikannya dengan
                    pihak Midtrans).</p>
            </div>
            <div class="mb-4">
                <h5 class="font-title">E. Pengamanan</h5>
                <p class="text-justify">Kreatora akan berusaha sebaik mungkin melindungi data dan informasi yang
                    dimiliki oleh pengguna. Namun kami tidak bisa sepenuhnya menjamin akan keamanan sistem yang kami
                    miliki dari virus, kerentanan, malware, dan ancaman lain dari pihak luar.</p>
            </div>
            <div class="mb-4">
                <h5 class="font-title">F. Kontak</h5>
                <div class="text-justify">
                    <p class="mb-1">Pengguna dapat menyampaikan saran, keluhan, permintaan, atau pertanyaan terkait
                        Kreatora melalui alamat email <a href="mailto:halo@kreatora.id">halo@kreatora.id</a>, atau
                        langsung datang ke kantor kami: <br>
                        Jalan Slamet Riyadi No.435, Purwosari, Laweyan, Pajang, <br>
                        Kec. Laweyan, Kota Surakarta, <br>
                        Jawa Tengah <br>
                        57146
                    </p>
                </div>
            </div>
        </div>
    </div>
@endsection
