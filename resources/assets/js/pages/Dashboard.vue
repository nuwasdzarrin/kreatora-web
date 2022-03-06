<template>
    <div>
		<div class="row bg-white">
			<div class="col-sm-12 col-md-12">
				<div class="row" style="margin: 0;padding: 15px;">
					<div class="col-sm-12 col-md-6">
						<div class="company-name"><strong>{{company.name}}</strong>
							<i class="fa fa-gear" style="margin-left:5px;color: rgb(211, 211, 211);"></i>
						</div>
						<div class="company-code">(Kode Perusahaan: {{company.code}})</div>
						<span class="company-address"><i class="fa fa-map-marker"></i> {{company.address}}</span>
					</div>
					<div class="col-sm-12 col-md-6" style="padding-top:5px;">
						<my-company-select></my-company-select>
					</div>
				</div>
			</div>
		</div>
        <!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0 text-dark">Dashboard</h1>
						</div><!-- /.col -->
					</div><!-- /.row -->
				</div><!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<!-- Small boxes (Stat box) -->
					<div class="row">
					  <div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-info">
						  <div class="inner">
							<h3>150</h3>

							<p>New Orders</p>
						  </div>
						  <div class="icon">
							<i class="ion ion-bag"></i>
						  </div>
						  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					  </div>
					  <!-- ./col -->
					  <div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-success">
						  <div class="inner">
							<h3>53<sup style="font-size: 20px">%</sup></h3>

							<p>Bounce Rate</p>
						  </div>
						  <div class="icon">
							<i class="ion ion-stats-bars"></i>
						  </div>
						  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					  </div>
					  <!-- ./col -->
					  <div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-warning">
						  <div class="inner">
							<h3>44</h3>

							<p>User Registrations</p>
						  </div>
						  <div class="icon">
							<i class="ion ion-person-add"></i>
						  </div>
						  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					  </div>
					  <!-- ./col -->
					  <div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-danger">
						  <div class="inner">
							<h3>65</h3>

							<p>Unique Visitors</p>
						  </div>
						  <div class="icon">
							<i class="ion ion-pie-graph"></i>
						  </div>
						  <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					  </div>
					  <!-- ./col -->
					</div>
					<!-- /.row -->
					<div class="row">
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-info">
								<div class="inner">
									<h3>150</h3>

									<p>New Orders</p>
								</div>
								<div class="icon">
									<i class="ion ion-bag"></i>
								</div>
								<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-success">
								<div class="inner">
									<h3>53<sup style="font-size: 20px">%</sup></h3>

									<p>Bounce Rate</p>
								</div>
								<div class="icon">
									<i class="ion ion-stats-bars"></i>
								</div>
								<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-warning">
								<div class="inner">
									<h3>44</h3>

									<p>User Registrations</p>
								</div>
								<div class="icon">
									<i class="ion ion-person-add"></i>
								</div>
								<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-danger">
								<div class="inner">
									<h3>65</h3>

									<p>Unique Visitors</p>
								</div>
								<div class="icon">
									<i class="ion ion-pie-graph"></i>
								</div>
								<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
					</div>
					<!-- /.row -->
				</div><!-- /.container-fluid -->
			</section>
			<!-- /.content -->
    </div>
</template>
<script>
	import Cookie from 'vue-cookie';
    export default {
    	data() {
    		return {
    			company: JSON.parse(Cookie.get("companySelected"))
			}
		},
		mounted() {
    		window.events.$on('my-company-select:changed', (e)=>{
    			this.$set(this,'company',e);
			})
		}
	}
</script>
<style scoped>
	.company-name {
		font-family: open sans,Helvetica Neue,Helvetica,Arial,sans-serif;
		font-size: 24px;
		margin-bottom: -5px;
	}
	.company-code {
		font-family: open sans, Helvetica Neue, Helvetica, Arial, sans-serif;
		font-size: 11px;
		color: #3c465a;
	}
	.company-address {
		font-family: open sans, Helvetica Neue, Helvetica, Arial, sans-serif;
		font-size: 13px;
		color: #98a9cb;
	}
</style>
