<script lang="ts">
  import Preloader from "./Preloader.svelte";

  export let className = '';
</script>

<div class="container {className}">
	<slot><Preloader/></slot>
</div>
