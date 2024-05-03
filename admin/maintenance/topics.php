<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Donations</h3>

	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-bordered table-stripped">
				<colgroup>
					<col width="5%">
					<col width="20%">
					<col width="25%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
				</colgroup>
				<thead>
					<tr>
						<th>#</th>
						<th>Date Created</th>
						<th>Title</th>
						<th>Fund Raised</th>
						<th>Fund Goal</th>
						<th>Status</th>

					</tr>
				</thead>
				<tbody>
					<?php 
					$i = 1;
					$qry = $conn->query("SELECT 
						b.*, 
						concat(u.name,'-',u.role) as author,
						d.fund_raised,
						d.fund_goal
					FROM 
						`blogs` b 
					INNER JOIN 
						`users` u ON b.author_id = u.id 
					LEFT JOIN 
						`donations` d ON b.id = d.blog_id 
					ORDER BY 
						unix_timestamp(b.date_created) DESC");
						
						while($row = $qry->fetch_assoc()):
							foreach($row as $k=> $v){
								$row[$k] = trim(stripslashes($v));
							}
                            $row['fund_raised'] = strip_tags(stripslashes(html_entity_decode($row['fund_raised'])));
					?>
						<tr>
							<td class="text-center"><?php echo $i++; ?></td>
							<td><?php echo date("Y-m-d H:i",strtotime($row['date_created'])) ?></td>
							<td><a href="<?php echo base_url.$row['blog_url'] ?>" target="_blank"><?php echo $row['title'] ?></a></td>
							<td ><p class="m-0 truncate-1"><?php echo $row['fund_raised'] ?></p></td>
							<td ><p class="m-0"><?php echo $row['fund_raised'] ?></p></td>
							<td class="text-center">
                                <?php if($row['status'] == 1): ?>
                                    <span class="badge badge-success">Active</span>
                                <?php else: ?>
                                    <span class="badge badge-danger">Inactive</span>
                                <?php endif; ?>
                            </td>

						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.delete_data').click(function(){
			_conf("Are you sure to delete this blog permanently?","delete_blog",[$(this).attr('data-id')])
		})
		$('.table').dataTable();
	})
	function delete_blog($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_blog",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}
</script>