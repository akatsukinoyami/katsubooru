<script lang="ts">
	import { links } from "svelte-navigator";
  import { signOut } from "../functions/auth";
  import { title, debug } from "../stores/index";
  import { currentUser } from "../stores/currentUser";

  $: pesentCurrentUser = $currentUser && Object.keys($currentUser).length > 0
</script>

<nav class="light-blue accent-4">
  <div class="nav-wrapper" use:links>
    <a href={location.origin} class="brand-logo">{$title}</a>
    <ul id="nav-mobile" class="right hide-on-med-and-down" use:links>
      {#if pesentCurrentUser}
        <li>Hello, {$currentUser.name}</li>
        <li><a href="{location.origin}/auth/sign_out" on:click={() => signOut()}>Sign out</a></li>
      {:else}
        <li><a href="{location.origin}/auth/sign_in">Sign in</a></li>
        <li><a href="{location.origin}/auth/sign_up">Sign up</a></li>
      {/if}
      <li><a href={"#"} on:click={() => console.log($debug)}>Debug</a></li>
    </ul>
  </div>
</nav>

<style lang="sass">
  .brand-logo
    padding: 0 0 0 10px

  a:visited
    color: white
    text-decoration: none
</style>
