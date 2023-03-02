<script lang="ts">
  import Row from "../../../components/Row.svelte";
  import Preloader from "../../../components/Preloader.svelte";
  import Main from './_Main.svelte';
  import Aside from './_Aside.svelte';
  import { entities } from "../../../stores";
  import i18n from "../../../i18n";
</script>

{#await entities.load()}
  <Preloader/>
{:then}
  {#if !entities.empty()}
    <Row>
      <Main/>
      <Aside/>
    </Row>
  {:else}
    {i18n().errors.empty.entities}
  {/if}
{:catch}
  {i18n().errors.load.entities}
{/await}
