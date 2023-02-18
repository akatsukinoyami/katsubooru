<script lang="ts">
  import { useParams } from "svelte-navigator";

  import Row from "../../../components/Row.svelte";
  import Col from "../../../components/Col.svelte";
  import Preloader from "../../../components/Preloader.svelte";
  import Aside from "./_Aside.svelte";
  import { entities } from "../../../stores";

	const params = useParams();
</script>

{#await entities.findById($params.id)}
  <Preloader/>
{:then entity}
  <Row>
    <Col s={12} l={9} className="push-l3">
      <img src={entity.file.url} alt="">
    </Col>
    <Aside entity={entity} />
  </Row>
{/await}
