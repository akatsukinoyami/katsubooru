<script lang="ts">
  import Col from "../../components/Col.svelte";
  import Row from "../../components/Row.svelte";
  import CardEntity from "../../components/CardEntity.svelte";
  import Preloader from "../../components/Preloader.svelte";
  import { entities } from "../../stores";

  import type ColInterface from "../../interfaces/col";

  const imageSize: ColInterface = { s:6, m:4, xl:3 }
</script>

<Row>
  <Col s={12} l={9} className="push-l3">
    {#if $entities}
      <Row>
        {#each $entities as entity (entity.id)}
          <Col {...imageSize}>
            <CardEntity entity={entity}/>
          </Col>
        {/each}
      </Row>
    {:else}
      <Preloader/>
    {/if}
  </Col>
  <Col s={12} l={3} className="pull-l9">
    <h5>Tags</h5>
  </Col>
</Row>
