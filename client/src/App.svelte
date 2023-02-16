<script lang="ts">
  import Layout from './partials/Layout.svelte';
  import Routes from './partials/Routes.svelte';

  import { title } from "./stores";
</script>

<svelte:head>
  <title>{$title}</title>
</svelte:head>

<Layout>
  <Routes/>
</Layout>

<style lang="sass">
  :global(html),
  :global(body)
    padding: 0
    display: flex
    min-height: 100vh
    flex-direction: column
</style>
