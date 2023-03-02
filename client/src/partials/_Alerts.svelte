<script lang="ts">
  import { alerts } from "../stores";
  import type { AlertInterface } from "../interfaces";

  function color(alert: AlertInterface): string {
    return alert.error ? 'red' : 'teal'
  }
</script>

{#if !alerts.empty()}
  <ul class="collection">
    {#each $alerts as alert }
      <li class="active collection-item {color(alert)}" id={alert.text}>
        <div>
          {alert.text}
          <a href={"#"} class="secondary-content" on:click={() => alerts.delete(alert.text)}>
            <i class="material-icons">close</i>
          </a>
        </div>
      </li>
    {/each}
  </ul>
{/if}
