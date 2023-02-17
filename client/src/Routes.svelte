<script lang="ts">
  import { useNavigate, Route } from "svelte-navigator";

  import SignIn from "./routes/auth/SignIn.svelte";
  import SignUp from "./routes/auth/SignUp.svelte";

  import EntitiesIndex from './routes/entities/index/Page.svelte';
  import EntitiesShow from './routes/entities/show/Page.svelte';
  import { currentUser } from "./stores/currentUser";

  const navigate = useNavigate();
</script>

<Route path="auth/*">
  <Route path="sign_in" component="{SignIn}" />
  <Route path="sign_up" component="{SignUp}" />
</Route>
<Route path="entities/*">
  <Route path="/" component="{EntitiesIndex}" />
  {#if currentUser.exists()}
    <Route path=":id" component="{EntitiesShow}" />
  {:else}
    {navigate('/')}
  {/if}
</Route>
<Route component="{EntitiesIndex}" />
