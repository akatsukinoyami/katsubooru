<script lang="ts">
  import Preloader from "./Preloader.svelte";

  export let className = '';
</script>

<div class="row {className}">
	<slot><Preloader/></slot>
</div>
