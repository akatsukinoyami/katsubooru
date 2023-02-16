<script>
  import Col from "../components/Col.svelte";
  import Container from "../components/Container.svelte";
  import Footer from "../components/Footer.svelte";
  import Row from "../components/Row.svelte";
</script>

<Footer>
  <Container>
    <Row>
      <Col className="l6 s12">
        <h5 class="white-text">Footer Content</h5>
        <p class="grey-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
      </Col>
      <Col className="l4 offset-l2 s12">
        <h5 class="white-text">Links</h5>
        <ul>
          <li><a class="grey-text text-lighten-3" href="#!">Link 1</a></li>
          <li><a class="grey-text text-lighten-3" href="#!">Link 2</a></li>
          <li><a class="grey-text text-lighten-3" href="#!">Link 3</a></li>
          <li><a class="grey-text text-lighten-3" href="#!">Link 4</a></li>
        </ul>
      </Col>
    </Row>
  </Container>
  <div class="footer-copyright">
    <Container>
    © 2014 Copyright Text
    <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
    </Container>
  </div>
</Footer>
