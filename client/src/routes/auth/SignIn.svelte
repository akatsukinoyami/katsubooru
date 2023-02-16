<script>
  import { useNavigate } from "svelte-navigator";

  import Container from "../../components/Container.svelte";
  import Row from "../../components/Row.svelte";
  import Col from "../../components/Col.svelte";
  import { signIn } from "../../functions/auth";

  const navigate = useNavigate();
  const colVars = { s: 12, className: "input-field" }

  async function onSubmit() {
    await signIn();
    navigate('/');
  }
</script>

<h1>Sign In</h1>

<Row style="padding-top: 20px;">
  <form class="col s12" on:submit|preventDefault={async () => { await onSubmit() }}>
    <Container>
      <Row>
        <Col {...colVars}>
          <i class="material-icons prefix">mail</i>
          <input value="hirokod3@gmail.com" id="email" type="email" class="validate" required>
          <label for="email">Email</label>
        </Col>
      </Row>
      <Row>
        <Col {...colVars}>
          <i class="material-icons prefix">password</i>
          <input value="q1w2e3r4" id="password" type="password" class="validate" required>
          <label for="password">Password</label>
        </Col>
      </Row>
      <Row>
        <Col {...colVars}>
          <button class="btn waves-effect waves-light light-blue accent-4" type="submit">
            Sign In
            <i class="material-icons right">send</i>
          </button>
        </Col>
      </Row>
    </Container>
  </form>
</Row>
