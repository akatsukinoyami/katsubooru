<script lang="ts">
  import Preloader from "./Preloader.svelte";

  export let
    className = '',
    style = '';
</script>

<div class="row {className}" style={style}>
	<slot><Preloader/></slot>
</div>
