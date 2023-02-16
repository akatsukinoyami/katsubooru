<script lang="ts">
  import Preloader from "./Preloader.svelte";

  export let className = '';
</script>

<footer class="page-footer {className}">
	<slot><Preloader/></slot>
</footer>
