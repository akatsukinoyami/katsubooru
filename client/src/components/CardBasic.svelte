<script lang="ts">
  import Col from "./Col.svelte";
  import Row from "./Row.svelte";

  interface LinkInterface {
    href: string,
    content: string,
  }

  export let
    title: string,
    content: string,
    links: LinkInterface[];

</script>

<Row>
  <Col s={12} m={6}>
    <div class="card blue-grey darken-1">
      <div class="card-content white-text">
        <span class="card-title">{title}</span>
        <p>{content}</p>
      </div>
      <div class="card-action">
        {#each links as {href, content}}
          <a href={href}>{content}</a>
        {/each}
      </div>
    </div>
  </Col>
</Row>
