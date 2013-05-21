starttag = nil

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey }, "f",
              function ()
                starttag = awful.tag.selected() -- get current tag
                awful.util.spawn_with_shell("firefox") 
              end)
)


-- {{{ Rules
awful.rules.rules = {
    { rule = { class = "Firefox" },
      properties = {}, callback =
                function (c)
                  if starttag then
                    awful.client.movetotag(starttag, c)
                    starttag = nil
                  end
                end
    }
}
-- }}}

