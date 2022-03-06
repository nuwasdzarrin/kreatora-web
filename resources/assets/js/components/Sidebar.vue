<template>
      <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="admin-lte/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Admin</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="admin-lte/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">{{name}}</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <li class="nav-item">
              <router-link  :to="{ name: 'dashboard'}"  class="nav-link">
                  <i class="nav-icon fa fa-bar-chart-o"  :class="{ 'text-info': isActive('dashboard') }"></i>
                  <p>Dashboard</p>
              </router-link>
            </li>
            <li class="nav-item">
                <router-link  :to="{ name: 'water-meter'}"  class="nav-link">
                    <i class="nav-icon fa fa-tachometer"  :class="{ 'text-info': isActive('water-meter') }"></i>
                    <p>Meteran Air</p>
                </router-link>
            </li>

            <li class="nav-item">
                <router-link  :to="{ name: 'billing'}"  class="nav-link">
                    <i class="nav-icon fa fa-list-alt"  :class="{ 'text-info': isActive('billing') }"></i>
                    <p>Tagihan</p>
                </router-link>
            </li>

            <li class="nav-item">
                <router-link  :to="{ name: 'customer'}"  class="nav-link">
                    <i class="nav-icon fa fa-users"  :class="{ 'text-info': isActive('customer') }"></i>
                    <p>Pelanggan</p>
                </router-link>
            </li>

            <li class="nav-item">
                <router-link  :to="{ name: 'rate-category'}"  class="nav-link">
                    <i class="nav-icon fa fa-th-large"  :class="{ 'text-info': isActive('rate-category') }"></i>
                    <p>Kategori Tarif</p>
                </router-link>
            </li>

<!--            <li class="nav-item">-->
<!--                <router-link  :to="{ name: 'price-setting'}"  class="nav-link">-->
<!--                    <i class="nav-icon fa fa-cogs"  :class="{ 'text-info': isActive('price-setting') }"></i>-->
<!--                    <p>Pengaturan Harga</p>-->
<!--                </router-link>-->
<!--            </li>-->

            <li class="nav-item">
                <router-link  :to="{ name: 'finance'}"  class="nav-link">
                    <i class="nav-icon fa fa-money"  :class="{ 'text-info': isActive('finance') }"></i>
                    <p>Keuangan</p>
                </router-link>
            </li>

            <li class="nav-item">
                <router-link  :to="{ name: 'user'}"  class="nav-link">
                    <i class="nav-icon fa fa-user-circle-o"  :class="{ 'text-info': isActive('user') }"></i>
                    <p>Pengguna</p>
                </router-link>
            </li>
        </ul>
      </nav>
          <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>
</template>

<script>
    import Cookie from 'vue-cookie';
    export default {
        data(){
          return {
            // name:JSON.parse(localStorage.getItem("myProfile")).name,
            name:JSON.parse(Cookie.get("myProfile")).name,
          }
        },
        mounted() {
            if (JSON.parse(Cookie.get("myProfile")).companies.length<1) this.$router.push({ name: 'company-create'});
        },
        methods: {
          isActive(menuItem) {
            return this.$route.name === menuItem;
          }
        }
    }
</script>
