    awful.key({ modkey, "Shift"   }, "Return", function () 
                                                   n = client.focus.name
                                                   n = n:gsub("~/", home)
                                                   awful.util.spawn(terminal .. " --working-directory=" .. n .. "/")
                                               end),


