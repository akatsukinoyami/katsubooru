<script lang="ts">
  import { useParams } from "svelte-navigator";

  import Col from "../../../components/Col.svelte";
  import Row from "../../../components/Row.svelte";
  import Preloader from "../../../components/Preloader.svelte";
  import { GET } from "../../../functions/request";
  import Main from "./_Main.svelte";
  import Aside from "./_Aside.svelte";
  // import {print} from "../../stores/index"
  // print.set({})

	const params = useParams();

  const entityPromise = GET({ path: '/api/entities/'+$params.id })
</script>

{#await entityPromise}
  <Preloader/>
{:then entity}
<Row>
  <Main  entity={entity} />
  <Aside entity={entity} />
</Row>
{/await}
