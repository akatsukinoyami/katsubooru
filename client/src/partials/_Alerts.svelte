<script lang="ts">
  import { alerts } from "../stores";
  import alertsHandler from "../functions/alerts";
  import type AlertInterface from "../interfaces/notice";

  $: localAlerts = $alerts

  function color(alert: AlertInterface) {
    return alert.error ? 'red' : 'teal'
  }
</script>

{#if localAlerts.length > 0}
  <ul class="collection">
    {#each localAlerts as alert }
      <li class="active collection-item {color(alert)}" id={alert.text}>
        <div>
          {alert.text}
          <a href={"#"} class="secondary-content" on:click={() => alertsHandler.delete(alert.text)}>
            <i class="material-icons">close</i>
          </a>
        </div>
      </li>
    {/each}
  </ul>
{/if}
