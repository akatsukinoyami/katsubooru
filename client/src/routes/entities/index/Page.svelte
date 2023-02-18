<script lang="ts">
  import Row from "../../../components/Row.svelte";
  import Preloader from "../../../components/Preloader.svelte";
  import { entities } from "../../../stores";
  import Main from './_Main.svelte';
  import Aside from './_Aside.svelte';
</script>

{#await entities.all()}
  <Preloader/>
{:then}
  {#if !entities.empty()}
    <Row>
      <Main  entities={entities.array()}/>
      <Aside entities={entities.array()}/>
    </Row>
  {/if}
{/await}
