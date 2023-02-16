<script lang="ts">
  import Preloader from "./Preloader.svelte";

  export let className = '';
</script>

<main class="container {className}">
	<slot><Preloader/></slot>
</main>

<style lang="sass">
  main
    flex: 1 0 auto
    padding: 10px
</style>
