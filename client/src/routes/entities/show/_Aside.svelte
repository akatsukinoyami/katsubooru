<script lang="ts">
  import Col from "../../../components/Col.svelte";
  import Preloader from "../../../components/Preloader.svelte";
  import { tags } from "../../../stores";
  import type { EntityInterface } from "../../../interfaces";

  export let entity: EntityInterface;
</script>

<Col s={12} l={3} className="pull-l9">
  {#await tags.all()}
    <Preloader/>
  {:then _tags}
    <h5>Tags</h5>

    {#if entity.artist_id}
      <p class="tag_header">Artist</p>
      <ul><li><a href={"/"}>{_tags.artists[entity.artist_id]}</a></li></ul>
    {/if}

    {#each ['tags', 'titles', 'characters'] as tagType (tagType)}
      <p class="tag_header">{tagType}</p>
      <ul>
        {#each entity[tagType] as tag (tag)}
          <li><a href={"/"}>{_tags[tagType][tag]}</a></li>
        {/each}
      </ul>
    {/each}
  {/await}
</Col>

<style lang="sass">
  .tag_header
    text-transform: capitalize
</style>
