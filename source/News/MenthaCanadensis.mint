module News {
  const MENTHA_CANADENSIS =
    {
      subtitle: "Mint 0.20.0 Released",
      author: "Gusztáv Szikszai",
      title: "Mentha Canadensis",
      time: Time.utc(2024, 11, 1),
      contents:
        defer {
          let deferredExample =
            <SimpleIde
              orientation="vertical"
              previewHeight="75px"
              contents={
                <<~MINT
                component Main {
                  state content : String = "Click me to load some other text!"

                  const TEXT = defer "Some long text here..."

                  fun render : Html {
                    <div onClick={() { next { content: await TEXT } }}>
                      content
                    </div>
                  }
                }
                MINT
              }
            />

          let asyncComponentExample =
            <SimpleIde
              orientation="vertical"
              previewHeight="75px"
              contents={
                <<~MINT
                async component Greeter {
                  fun render : Html {
                    <div>
                      "Hello World! I'm loaded asynchronously!"
                    </div>
                  }
                }

                component Main {
                  state shown : Bool = false

                  fun render : Html {
                    <div>
                      <button onclick={() { next { shown: true } }}>
                        "Show Greeting!"
                      </button>

                      if shown {
                        <Greeter/>
                      }
                    </div>
                  }
                }
                MINT
              }
            />

          let exhaustivenessExample =
            <SimpleIde
              orientation="vertical"
              previewHeight="450px"
              contents={
                <<~MINT
                component Main {
                  fun render : Html {
                    case Maybe.Just(Maybe.Just("Hello World!")) {
                      Just(Just(greeting)) => greeting
                    }
                  }
                }
                MINT
              }
            />

          let htmlExample =
            <SimpleIde
              orientation="vertical"
              previewHeight="100px"
              contents={
                <<~MINT
                component Main {
                  fun render : Html {
                    let variable =
                      "Hello World!"

                    <div>
                      variable
                      <br/>
                      "String"
                      <br/>
                      42
                      <br/>
                      ["Item1", "Item2"]
                    </div>
                  }
                }
                MINT
              }
            />

          <<#MARKDOWN(highlight)
      # Mentha Canadensis

      Mint is a type-safe programming language for writing single page
      applications. Today Mint `0.20.0` has been published, so let's go
      over all that's new.

      ## Rewrites, rewrites everywhere!

      Since `0.19.0` all but one part (type checker) of the source was
      rewritten or refactored, here is a non exhaustive list:

      * **Error Messages** - They were simplified internally, unified
        and reviewed across the board.
      * **Runtime** - Changed from [class components] to [functional
        components] and [signals], this allows a two level structure (
        components have internal entities otherwise is everything is one
        level)
      * **Compiler** - It was rewritten to emit ES5 modules and to support
        code-splitting.
      * **CLI** - Commands were reviewed and changed to better convey their
        functions. Some commands moved under the `tool` group.
      * **Formatter** - It was rewritten to support line-length aware
        formatting.
      * **Documentation Generator** - It was rewritten to be HTML by default.

      With these changes we are bringing you a modern and performant
      language for writing web applications.

      [functional components]: https://preactjs.com/guide/v10/components/#functional-components
      [class components]: https://preactjs.com/guide/v10/components/#class-components
      [signals]: https://preactjs.com/guide/v10/signals

      ## Deferred Code

      With the compiler refactor it's now possbile to asynchronously load
      code with the `defer` keyword.

      Any expression marked with `defer` are compiled into it's own file
      and can be loaded later with the `await` keyword.

      #{deferredExample}

      This makes it easy to create for example blogs where the actual posts
      are Mint files. This website is one example where we use this feature
      extensively.

      ## Async Components

      Components can now be marked `async` which means they will be compiled
      to their own file and will be loaded on demand when the component is
      rendered on the screen.

      #{asyncComponentExample}

      ## Fully Exhaustive Pattern Matching

      Patterns previously were only matched for exhaustivess at the top-level,
      now missing patterns are reported at any nesting level.

      #{exhaustivenessExample}

      ## Easier HTML

      Expressions now can be directly used in HTML tags (HTML expressions
      `<{...}>` are removed from the language), and in addition to `String`,
      `Number` can be used as well.

      #{htmlExample}

      ## New Website

      The website (which you are on now) was also rewitten from scratch. The
      previously separate [tutorial] and [sandbox] is now in the same code
      base thanks to deferred code and async components.

      [tutorial]: /tutorial/
      [sandbox]: /sandbox/
        MARKDOWN
        }
    }
}
