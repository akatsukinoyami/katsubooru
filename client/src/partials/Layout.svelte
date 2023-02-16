<script lang="ts">
  import { Router, Route } from "svelte-navigator";

  import Main from '../components/Main.svelte';

  import Alerts from "./_Alerts.svelte";
  import Navbar from './_Navbar.svelte';
  import Footer from './_Footer.svelte';
</script>

<Router primary={false}>
  <Navbar/>
  <Main>
    <Alerts/>
    <slot />
  </Main>
  <Footer/>
</Router>
