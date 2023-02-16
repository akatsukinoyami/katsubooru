<script lang="ts">
  import Preloader from "./Preloader.svelte";

  type columnSizeType = -1|0|1|2|3|4|5|6|7|8|9|10|11|12;

  export let
    className: string = '',
    s: columnSizeType = -1,
    m: columnSizeType = -1,
    l: columnSizeType = -1,
    xl:columnSizeType = -1;

  function sizeClass(columnType: string, columnSize: number): string {
    return columnSize >= 0 ? `${columnType}${columnSize} ` : ''
  }
</script>

<div class="col {sizeClass('s', s)}{sizeClass('m', m)}{sizeClass('l', l)}{sizeClass('xl', xl)} {className}">
	<slot><Preloader/></slot>
</div>
