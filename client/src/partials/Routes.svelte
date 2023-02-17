<script lang="ts">
  import { Route } from "svelte-navigator";
  import SignIn from "../routes/auth/SignIn.svelte";
  import SignUp from "../routes/auth/SignUp.svelte";

  import EntitiesIndex from '../routes/entities/index/Page.svelte';
  import EntitiesShow from '../routes/entities/show/Page.svelte';
</script>

<Route path="auth/*">
  <Route path="sign_in" component="{SignIn}" />
  <Route path="sign_up" component="{SignUp}" />
</Route>
<Route path="entities/*">
  <Route path=":id" component="{EntitiesShow}" />
  <Route path="/" component="{EntitiesIndex}" />
</Route>
<Route component="{EntitiesIndex}" />
