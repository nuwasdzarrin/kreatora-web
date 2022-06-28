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
                <div class="top-navbar-block-title ml-3">Pedoman Komunitas</div>
            </div>
        </div>
        <div class="container mt-4 pb-3 text-dark">
            <div class="mb-4">
                <p class="text-justify">Kreatora berkomitmen untuk mendorong kemajuan industri game Indonesia.
                    Demi mewujudkan hal tersebut Kreatora mengharapkan terbentuknya komunitas pengguna yang baik dan
                    berkualitas. Skema reward-based crowdfunding membutuhkan kepercayaan, kerjas keras, kerjasama, dan
                    konsistensi dalam implementasinya. Oleh karena itu Kreatoar ingin memberikan pedoman bagi komunitas
                    dalam penggunaan pelayanan Kreatora. Pedoman ini dapat ditingkatkan lagi kedepannya demi komunitas
                    yang lebih baik. Berikut adalah beberapa hal yang perlu diperhatikan di Kreatora
                </p>
            </div>
            <div class="mb-4">
                <h5 class="font-title">A. Himbauan</h5>
                <div class="text-justify">
                    <ol class="pl-3">
                        <li class="mb-2">Menjaga suasana yang kondusif, suportif, dan transparansi antar pengguna, baik
                            di dalam platform maupun di luar platform.</li>
                        <li class="mb-2">Memberikan masukan yang bersifat membangun dengan bahasa yang santun</li>
                        <li class="mb-2">Memenuhi ekspektasi pada karya yang akan atau yang sudah dipublikasikan</li>
                        <li class="mb-2">Tidak memberikan ekspektasi yang berlebihan atau memberikan informasi
                            palsu</li>
                        <li class="mb-2">Memberikan karya yang original dan menarik di mata masyarakat</li>
                    </ol>
                </div>
            </div>
            <div class="mb-4">
                <h5 class="font-title">B. Larangan</h5>
                <div class="text-justify">
                    <ol class="pl-3">
                        <li class="mb-2">Membuat situasi yang tidak nyaman, seperti melakukan atau mengajak kearah
                            pelecehan verbal, intimidasi, ancaman, diskriminasi, dan SARA </li>
                        <li class="mb-2">Melakukan spamming pada akun pribadi dan promosi hal-hal yang negative</li>
                        <li class="mb-2">Menggelapkan dana dukungan dan tidak memberikan reward yang semestinya</li>
                    </ol>
                </div>
            </div>
            <div class="mb-4">
                <p class="text-justify">Kreatora menghimbau pengguna untuk senantiasa melaporkan tindakan yang dirasa
                    melihat kegiatan yang melanggar ketentuan di email
                    <a href="mailto:kreatora.id@gmail.com">kreatora.id@gmail.com</a> atau
                    <a href="mailto:halo@kreatora.id">halo@kreatora.id</a>. Kreatora berhak untuk memberikan
                    peringatan, penghapusan konten atau melakukan ban permanen pada akun yang dinilai melanggar
                    ketentuan.
                </p>
            </div>
        </div>
    </div>
@endsection
