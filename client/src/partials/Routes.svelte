<script lang="ts">
  import { Route } from "svelte-navigator";
  import SignIn from "../routes/auth/SignIn.svelte";
  import SignUp from "../routes/auth/SignUp.svelte";
  import Index from '../routes/entity/Index.svelte';
</script>

<Route path="/sign_in" component="{SignIn}" />
<Route path="/sign_up" component="{SignUp}" />
<Route component="{Index}" />
