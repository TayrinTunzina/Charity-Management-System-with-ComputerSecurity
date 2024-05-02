<h1 class="text-light">Welcome to <?php echo $_settings->info('name') ?></h1>
<hr class="bg-light">
<div class="row">
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-light elevation-1"><i class="fas fa-book-open"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Donations Today</span>
                <span class="info-box-number text-right">
                <?php 
                    $donation = $conn->query("SELECT sum(fund_raised) as total FROM donations")->fetch_assoc()['total'];
                    echo number_format($donation);
                ?>

                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-blog"></i></span>

              <div class="info-box-content">
              <span class="info-box-text">Total Donors</span>
                <span class="info-box-number text-right">
                    <?php 
                        $totalDonors = $conn->query("SELECT COUNT(*) as totalDonors FROM `users` WHERE role = 'donor'")->fetch_assoc()['totalDonors'];
                        echo number_format($totalDonors);
                    ?>
                </span>

              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>

          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-calendar-day"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Ongoing Campaigns</span>
                <span class="info-box-number text-right">
                <?php 
                  $active_blogs = $conn->query("SELECT COUNT(*) as total FROM `blogs` WHERE status = '1'")->fetch_assoc()['total'];
                  echo number_format($active_blogs);
                  ?>

                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
        </div>
