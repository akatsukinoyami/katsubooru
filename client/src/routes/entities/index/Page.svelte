<script lang="ts">
  import Row from "../../../components/Row.svelte";
  import Preloader from "../../../components/Preloader.svelte";
  import { entities } from "../../../stores/entities";
  import Main from './_Main.svelte';
  import Aside from './_Aside.svelte';
</script>

{#await entities.value()}
  <Preloader/>
{:then _entities}
  {#if _entities.length > 0}
    <Row>
      <Main  entities={_entities}/>
      <Aside entities={_entities}/>
    </Row>
  {/if}
{/await}
