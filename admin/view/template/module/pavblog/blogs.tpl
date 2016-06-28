<?php
	echo $header;
	echo $column_left;
?>
<div id="content">

	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button class="btn btn-primary" onclick="$('#do-action').val('published');$('#form').submit();">
					<?php echo $objlang->get("button_publish"); ?></button>
				<a class="btn btn-success" onclick="$('#do-action').val('unpublished');$('#form').submit();">
					<?php echo $objlang->get('button_unpublish'); ?></a> |
				<a class="btn btn-danger" id="action-delete">
					<?php echo $objlang->get("button_delete"); ?></a>
			</div>
			<h1><?php echo $heading_title; ?>: Hiện có <i class="fa badge"><?php echo $total;?></i> bài viết</h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li>
					<a href="<?php echo $breadcrumb['href']; ?>">
						<?php echo $breadcrumb[ 'text']; ?>
					</a>
				</li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<!-- end div .page-header -->

	<div id="page-content" class="container-fluid">
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php if( is_array($error_warning) ) { echo implode("<br>",$error_warning); } else { echo $error_warning; } ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<?php if (isset($success) && !empty($success)) { ?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>

		<div id="ajaxloading" class="hide">
			<div class="alert alert-warning" role="alert"><?php echo $objlang->get('text_process_request'); ?></div>
		</div>

		<div class="toolbar"><?php require( dirname(__FILE__).'/toolbar.tpl' ); ?></div>
		<!-- tools bar blog -->

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
				<a href="https://docs.google.com/document/d/1nsVRIQQlRa5qBaBZt9QN0T1krH39zuS-5uyvKyO_-ME/edit?usp=sharing" target="_blank"><span class="help" title="Hướng dẫn sử dụng"><i class="fa fa-question"></i></span></a>
			</div>
			<div class="panel-body">


				<div class="box-columns">
					<form id="filter" method="post" action="<?php echo $action;?>">
						<table class="table no-border">
							<tr>
								<td class="col-sm-4"><input placeholder="<?php echo $objlang->get('text_filter_title');?>" class="form-control" name="filter[title]" value="<?php echo $filter['title'];?>" size="50"></td>
								<td class="col-sm-4"><?php //echo $objlang->get('text_category');?><?php echo $menus;?></td>
								<td class="col-sm-2">
									<button class="btn btn-primary form-control" type="submit" name="submit"><?php echo $objlang->get('text_filter');?></button>
								</td>									
								<td class="col-sm-2">
									<a class="btn btn-warning form-control" href="<?php echo $action_reset;?>"><?php echo $objlang->get('text_reset');?></a>
								</td>
							</tr>
						</table>
					</form>
					<form id="form" enctype="multipart/form-data" method="post" action="<?php echo $action;?>">
						<input type="hidden" name="do-action" value="" id="do-action">
						<table class="table">
							<thead>
								<tr>
									<td width="1" style="text-align: center;">
										<input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);">
									</td>
					                
					                <td class="text-left">
					                	<?php if ($sort == 'bd.title') { ?>
                    						<a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $objlang->get("entry_title");?></a>
                    					<?php } else { ?>
                    						<a href="<?php echo $sort_title; ?>"><?php echo $objlang->get("entry_title");?></a>
                    					<?php } ?>
                    				</td>
                    				
                    				<td class="center">
					                	<?php if ($sort == 'b.position') { ?>
                    						<a href="<?php echo $sort_position; ?>" class="<?php echo strtolower($order); ?>"><?php echo $objlang->get('text_position');?></a>
                    					<?php } else { ?>
                    						<a href="<?php echo $sort_position; ?>"><?php echo $objlang->get('text_position');?></a>
                    					<?php } ?>
                    					<a class="btn btn-primary btn-xs" onclick="$('#do-action').val('position');$('#form').submit();" class="button"><?php echo $objlang->get("button_save"); ?></a>
                    				</td>

									<td class="right"  width="100">
					                	<?php if ($sort == 'b.status') { ?>
                    						<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $objlang->get('text_status');?></a>
                    					<?php } else { ?>
                    						<a href="<?php echo $sort_status; ?>"><?php echo $objlang->get('text_status');?></a>
                    					<?php } ?>										
									</td>
									<td class="right"  width="100">
					                	<?php if ($sort == 'b.created') { ?>
                    						<a href="<?php echo $sort_created; ?>" class="<?php echo strtolower($order); ?>"><?php echo $objlang->get('text_created');?></a>
                    					<?php } else { ?>
                    						<a href="<?php echo $sort_created; ?>"><?php echo $objlang->get('text_created');?></a>
                    					<?php } ?>	
									</td>
									<td class="right"  width="100">
					                	<?php if ($sort == 'b.date_modified') { ?>
                    						<a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($order); ?>"><?php echo $objlang->get('text_date_modified');?></a>
                    					<?php } else { ?>
                    						<a href="<?php echo $sort_date_modified; ?>"><?php echo $objlang->get('text_date_modified');?></a>
                    					<?php } ?>	
									</td>									
									<td class="right"  width="60">
					                	<?php if ($sort == 'b.hits') { ?>
                    						<a href="<?php echo $sort_hits; ?>" class="<?php echo strtolower($order); ?>"><?php echo $objlang->get('text_hits');?></a>
                    					<?php } else { ?>
                    						<a href="<?php echo $sort_hits; ?>"><?php echo $objlang->get('text_hits');?></a>
                    					<?php } ?>	
									</td>
									<td class="right"  width="100">Action</td>
								</tr>
							</thead>
							
							<tbody>
								<?php foreach( $blogs as $blog ) {  // echo '<pre>'.print_r( $blog, 1 ); die;?>
								<tr>
									<td width="1" style="text-align: center;">
										<input type="checkbox" name="selected[]" value="<?php echo $blog['blog_id'];?>">
									</td>
									<?php
										if (empty($blog['keyword'])) {
									 		$linkBlog = $view_link.'index.php?route=pavblog/blog&blog_id='.$blog['blog_id']; 
									 	}else{
									 		$linkBlog = $view_link.$blog['keyword']; 
									 	}
									?>
									<td class="left"><a href="<?php echo sprintf($edit_link, $blog['blog_id']) ?>"><?php echo $blog['title'];?></a></td>
									<td class="center"  ><input class="form-control" name="position[<?php echo $blog['blog_id'];?>]" value="<?php echo $blog['position'];?>" style="width:40%"></td>
									<td class="right"><?php echo ($blog['status']?$objlang->get('text_enable'):$objlang->get('text_disable'));?></td>
									<td class="right"><?php echo $blog['created'];?></td>
									<td class="right"><?php echo $blog['date_modified'];?></td>
									<td class="right"><?php echo $blog['hits'];?></td>
									<td class="right"><a href="<?php echo sprintf($edit_link, $blog['blog_id']) ?>"><?php echo $objlang->get('text_edit');?></a>
										| <a href="<?php echo $linkBlog ?>" target="_blank" title="Xem bài viết ngoài trang chủ">Xem</a>
									</td>
								</tr>
								<?php } ?>
							</tbody>
						</table>
					</form>
					<div class="pagination">
						<?php echo $pagination;?>
					</div>
				</div>

			</div>
		</div>

	</div><!-- end div #page-content -->
</div><!-- end div #content -->

<script type="text/javascript">
	$("#action-delete").click(function() {
		if(confirm("<?php echo $objlang->get('text_confirm_delete'); ?>"))
			__submit('delete');
		return false;
	});

	function __submit(val) {
		$("#do-action").val(val);
		$("#form").submit();
	}
</script>
<?php echo $footer; ?>