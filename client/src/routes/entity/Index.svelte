<script lang="ts">
  import { onDestroy } from "svelte";

  import Col from "../../components/Col.svelte";
  import Row from "../../components/Row.svelte";
  import CardEntity from "../../components/CardEntity.svelte";
  import Preloader from "../../components/Preloader.svelte";
  import { entities } from "../../stores";

  import type ColInterface from "../../interfaces/col";
  import type TagsInterface from "../../interfaces/tags";

  const allTags: TagsInterface = { artist: [], tags: [], titles: [], characters: [] };
  const imageSize: ColInterface = { s:6, m:4, xl:3 };
  const tagTypes = ['artist', 'tags', 'titles', 'characters'];

  $: {
    tagTypes.map((tagType)=>{
      const pluckedTags = $entities.map((entity) => { return entity[tagType] });
      const flatenTags = pluckedTags.flat();
      if (flatenTags.length > 0 ) {
        const uniqTags = [...new Map(flatenTags.map(item => [item.id, item])).values()];
        allTags[tagType] = uniqTags;
      }

    })
  }

</script>

{#if $entities}
  <Row>
    <Col s={12} l={9} className="push-l3">
        <Row>
          {#each $entities as entity (entity.id)}
            <Col {...imageSize}>
              <CardEntity entity={entity}/>
            </Col>
          {/each}
        </Row>
    </Col>
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
  </Row>
{:else}
  <Preloader/>
{/if}

<style lang="sass">
  .tag_header
    text-transform: capitalize
</style>
