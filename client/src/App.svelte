<script lang="ts">
	import { Router } from "svelte-navigator";
  import TopAppBar, { AutoAdjust } from '@smui/top-app-bar';
  import Navbar from "./components/Navbar.svelte";

  let topAppBar: TopAppBar;
</script>


<Router primary={false}>
  <TopAppBar bind:this={topAppBar} variant="short">
    <Navbar/>
  </TopAppBar>
  <AutoAdjust {topAppBar}>
  </AutoAdjust>
</Router>


<style lang="sass">
  /* Hide everything above this component. */
  :global(#smui-app),
  :global(body),
  :global(html)
    display: block !important
    height: auto !important
    width: auto !important
    position: static !important
</style>
