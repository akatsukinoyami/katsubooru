<script lang="ts">
  import { Route } from "svelte-navigator";

  import SignIn from "./routes/auth/SignIn.svelte";
  import SignUp from "./routes/auth/SignUp.svelte";

  import EntitiesIndex from './routes/entities/index/Page.svelte';
  import EntitiesShow from './routes/entities/show/Page.svelte';
  import EntitiesForm from './routes/entities/form/Page.svelte';
  import Preloader from "./components/Preloader.svelte";

  import { tags } from "./stores";
  import i18n from "./i18n/i18n";
</script>

<Route path="auth/*">
  <Route path="sign_in" component="{SignIn}" />
  <Route path="sign_up" component="{SignUp}" />
</Route>

{#await tags.load()}
  <Preloader/>
{:then}
  <Route path="entities/*">
    <Route path="/" component="{EntitiesIndex}" />
    <Route path=":id" component="{EntitiesShow}" />
    <Route path="/create" component="{EntitiesForm}" />
  </Route>
  <Route component="{EntitiesIndex}" />
{:catch}
  {i18n().errors.load.tags}
{/await}
