<script lang="ts">
  import Preloader from "./Preloader.svelte";

  type columnSizeType = 0|1|2|3|4|5|6|7|8|9|10|11|12;

  export let
    className = '',
    size: columnSizeType = 0;

  let columnSize = size ? `s${size}` : '';
</script>

<div class="col {className} {columnSize}">
	<slot><Preloader/></slot>
</div>
