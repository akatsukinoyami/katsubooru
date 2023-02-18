<script lang="ts">
  import Col from "../../../components/Col.svelte";
  import Row from "../../../components/Row.svelte";
  import CardEntity from "../../../components/CardEntity.svelte";
  import type { ColInterface, EntityInterface } from "../../../interfaces";

  export let entities: EntityInterface[];
  const imageSize: ColInterface = { s:6, m:4, xl:3 };
</script>

<Col s={12} l={9} className="push-l3">
  <Row>
    {#each entities as entity (entity.id)}
      <Col {...imageSize}>
        <CardEntity entity={entity}/>
      </Col>
    {/each}
  </Row>
</Col>
