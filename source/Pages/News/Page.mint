component Pages.News.Page {
  // The contents to display.
  property contents : Html

  // The news item for metadata.
  property news : News

  // Styles for the root element.
  style root {
    max-width: 100ch;
    margin: 0 auto;
    width: 100%;
  }

  // Renders the component.
  fun render : Html {
    <div::root><Content>contents</Content></div>
  }
}
