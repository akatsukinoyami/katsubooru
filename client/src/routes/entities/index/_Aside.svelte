<script lang="ts">
  import Col from "../../../components/Col.svelte";
  import { tags } from "../../../stores";
  import { entities } from "../../../stores";
</script>

<Col s={12} l={3} className="pull-l9">
  {#each Object.entries(entities.tags()) as [tagType, tagIds] (tagType)}
    <p class="tag_header">{tagType}</p>
    <ul>
      {#each tagIds as tagId (tagId)}
        <li><a href={"/"}>{tags.findById(tagId).name}</a></li>
      {/each}
    </ul>
  {/each}
</Col>

<style lang="sass">
  .tag_header
    text-transform: capitalize
</style>
