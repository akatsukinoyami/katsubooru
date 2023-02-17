<script lang="ts">
  import { Router } from 'svelte-navigator';
  import Routes from './Routes.svelte';
  import Main from './components/Main.svelte';

  import Alerts from "./partials/_Alerts.svelte";
  import Navbar from './partials/_Navbar.svelte';
  import Footer from './partials/_Footer.svelte';

  import { title } from "./stores";
</script>

<svelte:head>
  <title>{$title}</title>
</svelte:head>

<Router primary={false}>
  <Navbar/>
  <Main>
    <Alerts/>
    <Routes/>
  </Main>
  <Footer/>
</Router>

<style lang="sass">
  :global(html),
  :global(body)
    padding: 0
    min-height: 100vh
    display: flex
    flex-direction: column
</style>
