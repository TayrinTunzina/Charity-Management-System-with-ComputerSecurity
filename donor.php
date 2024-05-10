<?php require_once('config.php'); 
// Check if the user is not logged in and redirect to the login page
if(!isset($_SESSION['role']) || $_SESSION['role'] !== 'donor') {
    redirect('index.php');
}
?>

<!DOCTYPE HTML>
<html lang="en">
<head>
<title> Donor | <?php echo $_settings->info('short_name') ?></title>
<?php require_once(base_app.'inc/page_header.php') ?>

<style>
    .scrolling-cards-container {
        max-height: 600px; /* Set maximum height for vertical scrolling */
        overflow-y: auto; /* Enable vertical scrolling */
    }
</style>

</head>
<body>

<?php include(base_app.'inc/body_block.php') ?>

<div class="scrolling-cards-container">
<?php
        // Assuming you have already connected to your database
        $query = "SELECT b.*, d.fund_raised, d.fund_goal 
                  FROM blogs b 
                  LEFT JOIN donations d ON b.id = d.blog_id";
        $result = mysqli_query($conn, $query);

        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $status_text = $row['status'] == 1 ? 'Active' : 'Inactive';
                $status_class = $row['status'] == 1 ? 'text-success' : 'text-danger';

                // Calculate percentage of fund raised relative to fund goal
                if ($row['fund_goal'] != 0) {
                    $percentage = ($row['fund_raised'] / $row['fund_goal']) * 100;
                    $percentage = min($percentage, 100); // Ensure percentage doesn't exceed 100%
                } else {
                    $percentage = 0;
                }

                echo '<div class="card">';
                echo '<div class="card-body">';
                echo '<h5 class="card-title">' . $row['title'] . '</h5>';
                echo '<p class="card-text">' . $row['meta_description'] . '</p>';
                echo '<p class="card-text">Status: <span class="' . $status_class . '">' . $status_text . '</span></p>';
                echo '<div class="progress" style="height: 18px; width: 75%">';
                echo '<div class="progress-bar bg-success" role="progressbar" style="width: ' . $percentage . '%" aria-valuenow="' . $percentage . '" aria-valuemin="0" aria-valuemax="100">' . number_format($row['fund_raised']) . ' / ' . number_format($row['fund_goal']) . '</div>';
                echo '</div><br>';
                //echo '<a href="' . base_url . $row['blog_url'] . '" target="_blank" class="btn btn-primary">Read More</a>';
                echo '<a href="' . base_url . $row['blog_url'] . '" class="btn btn-primary">Read More</a>';

                
                // Disable the donate button and change status to inactive if fund goal is reached
                if ($percentage >= 100) {
                    // echo '<button class="btn btn-flat btn-success float-right" type="button" id="donation" data-toggle="modal" data-target="#paymentModal" data-blog-id="' . $row['id'] . '" disabled>Donate Now</button>';
                    echo '<button class="btn btn-flat btn-success float-right donation-button" type="button" id="donation" data-toggle="modal" data-target="#paymentModal" data-blog-id="' . $row['id'] . '" disabled>Donate Now</button>';
                } else {
                    echo '<button class="btn btn-flat btn-success float-right donation-button" type="button" id="donation" data-toggle="modal" data-target="#paymentModal" data-blog-id="' . $row['id'] . '">Donate Now</button>';
                }
                
                echo '</div>';
                echo '</div>';
            }
        } else {
            echo 'No posts found.';
        }
        ?>
    
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const donationButtons = document.querySelectorAll('.donation-button');

        donationButtons.forEach(button => {
            button.addEventListener('click', function() {
                const blogId = button.getAttribute('data-blog-id');
                document.getElementById('blogIdInput').value = blogId;
            });
        });
    });
</script>

<!-- Payment Modal -->
<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="paymentModalLabel">Donate</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Add payment form with OTP verification -->
                <form id="paymentForm" action="otp.php" method="POST">
                    <div class="form-group">
                        <label>Donation ID: </label>
                        <input type="text" id="blogIdInput" name="blog_id" readonly>
                    </div>

                    <div class="form-group">
                        <label for="paymentMethod">Payment Method:</label>
                        <select class="form-control" id="paymentMethod" name="paymentMethod">
                            <option value="" selected disabled>Select Payment Method</option>
                            <option value="cash">Mobile Banking</option>
                            <option value="card">Card</option>
                        </select>
                    </div>

                    <div id="cashPaymentOptions" style="display: none;">
                        <p>Select Cash Payment Method:</p>
                        <label style="margin-right: 20px;">
                            <input type="radio" name="cashPaymentMethod" value="bkash">
                            <img src="images/bkash.png" alt="bKash" style="width: 100px;">
                        </label>
                        <label style="margin-right: 20px;">
                            <input type="radio" name="cashPaymentMethod" value="nagad">
                            <img src="images/nagad.png" alt="Nagad" style="width: 100px;">
                        </label>
                        <label>
                            <input type="radio" name="cashPaymentMethod" value="rocket">
                            <img src="images/rocket.png" alt="Rocket" style="width: 100px;">
                        </label>
                    </div>


                    <div id="cardPaymentDetails" style="display: none;">
                        <div class="form-group">
                            <label for="cardNumber">Card Number:</label>
                            <input type="text" class="form-control" id="cardNumber" name="cardNumber">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="amount">Amount:</label>
                        <input type="number" class="form-control" id="amount" name="amount" required>
                    </div>

                    <?php
                    $otp=rand(00000, 99999);
                    ?>

                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                        <input type="hidden" name="otp" value="<?php echo $otp; ?>">
                    </div>

                    <button type="submit" class="btn btn-primary" id="payButton">Pay</button>
                </form>
            </div>
        </div>
    </div>
</div>


<script>
document.getElementById('paymentMethod').addEventListener('change', function() {
    var paymentMethod = this.value;
    var cashPaymentOptions = document.getElementById('cashPaymentOptions');
    var cardPaymentDetails = document.getElementById('cardPaymentDetails');

    if (paymentMethod === 'cash') {
        cashPaymentOptions.style.display = 'block';
        cardPaymentDetails.style.display = 'none';
    } else if (paymentMethod === 'card') {
        cashPaymentOptions.style.display = 'none';
        cardPaymentDetails.style.display = 'block';
    }
});

</script>


<?php require_once(base_app.'inc/footer.php') ?>

</body>
</html>



