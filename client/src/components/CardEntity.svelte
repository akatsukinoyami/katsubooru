<script lang="ts">
	import { links } from "svelte-navigator";
  import type EntityInterface from "../interfaces/entity";

  export let entity: EntityInterface;
</script>

<a
  class="card" use:links
  href="{location.origin}/entities/{entity.id}"
  style="background-image: url({entity.thumb});"
>&nbsp;</a>

<style lang="sass">
  a
    display: block
    height: 200px
    background-repeat: no-repeat
    background-size: cover
    background-position: center top
    transition: .1s

    &:hover
      text-decoration: none
      transform: scale(1.02)
</style>
