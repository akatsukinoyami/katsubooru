<script lang="ts">
  import Col from "../../../components/Col.svelte";
  import Row from "../../../components/Row.svelte";
  import CardEntity from "../../../components/CardEntity.svelte";
  import { entities } from "../../../stores";
  import type { ColInterface } from "../../../interfaces";

  const imageSize: ColInterface = { s:6, m:4, xl:3 };
</script>

<Col s={12} l={9} className="push-l3">
  <Row>
    {#each entities.values() as entity (entity.id)}
      <Col {...imageSize}>
        <CardEntity entity={entity}/>
      </Col>
    {/each}
  </Row>
</Col>
