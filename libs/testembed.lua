return {
  content = "this `supports` __a__ **subset** *of* ~~markdown~~ ```js\nfunction foo(bar) {\n  console.log(bar);\n}\n\nfoo(1);```",
  embed = {
    title = "title ~~(did you know you can have markdown here too?)~~",
    description = "this supports [named links](https://discordapp.com) on top of the previously shown subset of markdown. ```\nyes, even code blocks```",
    url = "https://discordapp.com",
    color = 12817061,
    timestamp = "2017-05-12T21:30:10.462Z",
    footer = {
      icon_url = "https://cdn.discordapp.com/embed/avatars/0.png",
      text = "footer text",
    },
    thumbnail = {
      url = "https://cdn.discordapp.com/embed/avatars/0.png",
    },
    image = {
      url = "https://cdn.discordapp.com/embed/avatars/0.png",
    },
    author = {
      name = "author name",
      url = "https://discordapp.com",
      icon_url = "https =//cdn.discordapp.com/embed/avatars/0.png"
    },
    fields = {
      {
        name = "test1",
        value = "some of these properties have certain limits..."
      },
      {
        name = "test2",
        value = "try exceeding some of them!"
      },
      {
        name = "test3",
        value = "an informative error should show up, and this view will remain as-is until all issues are fixed"
      },
      {
        name = "more test",
        value = "???"
      }
  	}
  }
}
