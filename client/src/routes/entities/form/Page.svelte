<script lang="ts">
  import Row from "../../../components/Row.svelte";
  import Col from "../../../components/Col.svelte";
  import Button from "../../../components/Button.svelte";
  import Preloader from "../../../components/Preloader.svelte";
  import { tags } from "../../../stores";
</script>

{#await tags.all()}
  <Preloader/>
{:then entity}
  <h1>Create Entity</h1>
  <Row>
    <Col s={12} m={6} className="input-field">
      <input placeholder="Upload by link" id="file_link" type="text" class="validate">
      <label for="file_link">URL</label>
    </Col>
    <Col s={12} m={6} className="input-field file-field">
      <Button text="Browse">
        <input type="file" />
      </Button>

      <div class="file-path-wrapper">
        <input class="file-path validate" type="text" placeholder="Upload file" />
      </div>
    </Col>
  </Row>
  <Row>

  </Row>
{/await}
