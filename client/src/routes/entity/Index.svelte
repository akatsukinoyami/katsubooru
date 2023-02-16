<script lang="ts">
  import { onDestroy } from "svelte";

  import Col from "../../components/Col.svelte";
  import Row from "../../components/Row.svelte";
  import CardEntity from "../../components/CardEntity.svelte";
  import Preloader from "../../components/Preloader.svelte";
  import { entities, tags } from "../../stores";

  import type ColInterface from "../../interfaces/col";
    import type TagInterface from "../../interfaces/tag";

  const imageSize: ColInterface = { s:6, m:4, xl:3 }

  let allTags: any;

  $: allTags = {
      artists:    $entities.map((entity) => { return entity.artist }),
      tags:       $entities.map((entity) => { return entity.tags }).flat(),
      titles:     $entities.map((entity) => { return entity.titles }).flat(),
      characters: $entities.map((entity) => { return entity.characters }).flat(),
    }

  function onClick(){
    console.log({ $entities, $tags, allTags })
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
      {#if allTags.artists}
        <p on:click={onClick}>Artists</p>
        {#each allTags.artists as tag (tag)}
          {tag}
        {/each}
      {/if}

      {#if allTags.titles}
        <p>Titles</p>
        {#each allTags.titles as tag (tag)}
          {tag}
        {/each}
      {/if}

      {#if allTags.characters}
        <p>Characters</p>
        {#each allTags.characters as tag (tag)}
          {tag}
        {/each}
      {/if}

      {#if allTags.tags}
        <p>Tags</p>
        {#each allTags.tags as tag (tag)}
          {tag}
        {/each}
      {/if}
    </Col>
  </Row>
{:else}
  <Preloader/>
{/if}
