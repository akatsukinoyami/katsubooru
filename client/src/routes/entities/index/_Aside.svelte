<script lang="ts">
  import Col from "../../../components/Col.svelte";
  import { entities } from "../../../stores/entities";
  import type TagsInterface from "../../../interfaces/tags";

  const allTags: TagsInterface = { artist: [], tags: [], titles: [], characters: [] };
  const tagTypes = ['artist', 'tags', 'titles', 'characters'];

  $: tagTypes.map((tagType)=>{
      const pluckedTags = $entities.map((entity) => { return entity[tagType] });
      const flatenTags = pluckedTags.flat();

      if (flatenTags.length > 0 ) {
        const uniqTags = [...new Map(
          flatenTags.map(item => [item.id, item])
        ).values()];
        allTags[tagType] = uniqTags;
      };
    });

</script>

<Col s={12} l={3} className="pull-l9">
  {#each tagTypes as tagType (tagType)}
    {#if allTags[tagType].length > 0}
      <p class="tag_header">{tagType}</p>
      <ul>
        {#each allTags[tagType] as tag (tag)}
          <li><a href={"/"}>{tag.name}</a></li>
        {/each}
      </ul>
    {/if}
  {/each}
</Col>

<style lang="sass">
  .tag_header
    text-transform: capitalize
</style>
