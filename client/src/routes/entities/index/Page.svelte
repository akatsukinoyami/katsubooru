<script lang="ts">
  import Row from "../../../components/Row.svelte";
  import Preloader from "../../../components/Preloader.svelte";
  import { entities } from "../../../stores/entities";
  import Main from './_Main.svelte';
  import Aside from './_Aside.svelte';
</script>

{#if $entities}
  <Row>
    <Main/>
    <Aside/>
  </Row>
{:else}
  <Preloader/>
{/if}
