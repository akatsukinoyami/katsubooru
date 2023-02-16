<script lang="ts">
  import Container from "./Container.svelte";
  import Preloader from "./Preloader.svelte";

  export let className = '';
</script>

<footer class="page-footer light-blue accent-4 {className}">
  <div class="footer-copyright">
    <Container>
	    <slot><Preloader/></slot>
    </Container>
  </div>
</footer>
