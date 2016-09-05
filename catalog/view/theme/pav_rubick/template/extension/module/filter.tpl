<div class="panel refine-search">
  <div class="panel-heading"><h3 class="panel-title"><?php echo $heading_title; ?></h3></div>
  <div class="panel-body">
    <?php foreach ($filter_groups as $filter_group) { ?>
    <div class="list-group">
        <a class="list-group-item"><?php echo $filter_group['name']; ?></a>
        <div class="list-group-item">
          <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
            <?php foreach ($filter_group['filter'] as $filter) { ?>
              <label>
                <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
                <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
                <?php echo $filter['name']; ?>
                <?php } else { ?>
                <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
                <?php echo $filter['name']; ?>
                <?php } ?>
              </label>
            <?php } ?>
          </div>
        </div>
    </div>
    <?php } ?>
  </div>
  <div class="text-left padding-top-15">
    <button type="button" id="button-filter" class="btn btn-success btn-sm"><?php echo $button_filter; ?></button>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
  filter = [];

  $('input[name^=\'filter\']:checked').each(function(element) {
    filter.push(this.value);
  });

  location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script>
