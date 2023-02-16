<script lang="ts">
  import { Router } from 'svelte-navigator';

  import Navbar from './partials/Navbar.svelte';
  import Main from './partials/Main.svelte';
  import Footer from './partials/Footer.svelte';

  import { title } from "./stores";
</script>

<svelte:head>
  <title>{$title}</title>
</svelte:head>

<Router>
  <Navbar/>
  <Main/>
  <Footer/>
</Router>

<style lang="sass">
  :global(html),
  :global(body)
    padding: 0
    display: flex
    min-height: 100vh
    flex-direction: column
</style>
