<?php echo $header; ?>

<div id="content"><?php echo $content_top; ?>

<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
</div>
  
<h1><img src="catalog/view/theme/default/image/cpm/download.png" alt="" /> <?php echo $heading_title; ?></h1>
<div class="buttons"><div class="right"><a onclick="location = '<?php echo $insert; ?>'" class="button"><?php echo $button_insert; ?></a> <a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div></div>

<?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>

<div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php if ($sort == 'dd.name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
              <td class="right"><?php if ($sort == 'd.remaining') { ?>
                <a href="<?php echo $sort_remaining; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_remaining; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_remaining; ?>"><?php echo $column_remaining; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($downloads) { ?>
            <?php foreach ($downloads as $download) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($download['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $download['download_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $download['download_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $download['name']; ?></td>
              <td class="right"><?php echo $download['remaining']; ?></td>
              <td class="right"><?php foreach ($download['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>

  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  
  <?php echo $content_bottom; ?></div>

<script type="text/javascript">
$(document).ready(function(){
    // Confirm Delete
    $('#form').submit(function(){
        if ($(this).attr('action').indexOf('delete',1) != -1) {
            if (!confirm('<?php echo $text_confirm; ?>')) {
                return false;
            }
        }
    });
});
</script>

<?php echo $footer; ?>