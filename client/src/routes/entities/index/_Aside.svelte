<script lang="ts">
  import Col from "../../../components/Col.svelte";
  import Preloader from "../../../components/Preloader.svelte";
  import { tags } from "../../../stores";
  import type { EntityInterface } from "../../../interfaces";

  export let entities: EntityInterface[];

  interface TagIdsInterface {
    artists?:     number[],
    tags?:        number[],
    titles?:      number[],
    characters?:  number[],
  }

  const tagIds: TagIdsInterface = {
    artists:     [],
    tags:       [],
    titles:     [],
    characters: [],
  }

  $: {
    ["tags", "titles", "characters"].forEach((tag) => {
      entities.forEach((entity: EntityInterface) => {
        tagIds[tag].push(...entity[tag]);
      })
      tagIds[tag] = [...new Set(tagIds[tag])]
    })
    entities.forEach((entity: EntityInterface) => {
      tagIds.artists.push(entity.artist_id);
    })
    tagIds.artists = [...new Set(tagIds.artists)]
  }
</script>

<Col s={12} l={3} className="pull-l9">
  {#await tags.all()}
    <Preloader/>
  {:then _tags}
    {#each Object.keys(tagIds) as tagType (tagType)}
      <p class="tag_header">{tagType}</p>
      <ul>
        {#each tagIds[tagType] as tag (tag)}
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
