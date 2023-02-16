<script lang="ts">

  let links = [
    { href: "sass.html", content: "Sass" },
    { href: "badges.html", content: "Components" },
    { href: "collapsible.html", content: "JavaScript" },
  ]
</script>

<nav>
  <div class="nav-wrapper">
    <a href={"#"} class="brand-logo">Logo</a>
    <ul id="nav-mobile" class="right hide-on-med-and-down">
      {#each links as {href, content}}
        <li><a href={href}>{content}</a></li>
      {/each}
    </ul>
  </div>
</nav>
