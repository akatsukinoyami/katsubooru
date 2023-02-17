<script lang="ts">
  import Col from "../../../components/Col.svelte";
  import type EntityInterface from "../../../interfaces/entity";

  export let entity: EntityInterface;
</script>

<Col s={12} l={3} className="pull-l9">
  <h5>Tags</h5>
  {#if entity.artist}
    <p class="tag_header">Artist</p>
    <ul><li><a href={"/"}>{entity.artist.name}</a></li></ul>
  {/if}
  {#each ['tags', 'titles', 'characters'] as tagType (tagType)}
    <p class="tag_header">{tagType}</p>
    <ul>
      {#each entity[tagType] as tag (tag)}
        <li><a href={"/"}>{tag.name}</a></li>
      {/each}
    </ul>
  {/each}
</Col>

<style lang="sass">
  .tag_header
    text-transform: capitalize
</style>
