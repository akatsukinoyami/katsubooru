<script lang="ts">
  import Col from "../../../components/Col.svelte";
  import type ColInterface from "../../../interfaces/col";
  import type EntityInterface from "../../../interfaces/entity";

  export let entity: EntityInterface;
  const imageSize: ColInterface = { s:6, m:4, xl:3 };

</script>

<Col s={12} l={9} className="push-l3">
  <img src={entity.file.url} alt="">
</Col>
