<script lang="ts">
	import { Router } from "svelte-navigator";

  import Aside from "./components/Aside.svelte";
  import Main from "./components/Main.svelte";
  import Navbar from "./components/Navbar.svelte";
</script>

<Router primary={false}>
    <Navbar/>
    <Aside />
    <Main />
</Router>

<style lang="sass">
  :global(html),
  :global(body)
    padding: 0
</style>
