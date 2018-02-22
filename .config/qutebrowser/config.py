#!/bin/python3

import subprocess
def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props
xresources = read_xresources('*')

c.content.plugins = True # May be dangerous, but danger is my middle name.
c.statusbar.position = "top"
c.tabs.position = "top"

""" Colors below """
c.colors.statusbar.normal.bg = xresources['*color0']
c.colors.statusbar.normal.fg = xresources['*color7']
c.colors.statusbar.caret.bg = xresources['*color6']
c.colors.statusbar.caret.fg = xresources['*color0']
c.colors.statusbar.private.bg = xresources['*color0']
c.colors.statusbar.private.fg = xresources['*color7']
c.colors.statusbar.command.bg = xresources['*color6']
c.colors.statusbar.command.fg = xresources['*color0']
c.colors.statusbar.insert.bg = xresources['*color2']
c.colors.statusbar.insert.fg = xresources['*color7']
c.colors.statusbar.progress.bg = xresources['*color7']
c.colors.statusbar.url.fg = xresources['*color7']
c.colors.statusbar.url.error.fg = xresources['*color1']
c.colors.statusbar.url.hover.fg = xresources['*color4']
c.colors.statusbar.url.success.http.fg = xresources['*color7']
c.colors.statusbar.url.success.https.fg = xresources['*color2']
c.colors.statusbar.url.warn.fg = xresources['*color3']
c.colors.tabs.bar.bg = xresources['*color0']
c.colors.tabs.even.bg = xresources['*color0']
c.colors.tabs.even.fg = xresources['*color7']
c.colors.tabs.odd.bg = xresources['*color0']
c.colors.tabs.odd.fg = xresources['*color7']
c.colors.tabs.selected.even.bg = xresources['*color7']
c.colors.tabs.selected.even.fg = xresources['*color0']
c.colors.tabs.selected.odd.bg = xresources['*color7']
c.colors.tabs.selected.odd.fg = xresources['*color0']
c.colors.completion.category.bg = xresources['*color6']
c.colors.completion.category.fg = xresources['*color0']
c.colors.completion.category.border.bottom = xresources['*color0']
c.colors.completion.category.border.top = xresources['*color6']
c.colors.completion.even.bg = xresources['*color0']
c.colors.completion.odd.bg = xresources['*color0']
c.colors.completion.item.selected.bg = xresources['*color4']
c.colors.completion.item.selected.fg = xresources['*color7']
c.colors.completion.item.selected.border.bottom = xresources['*color4']
c.colors.completion.item.selected.border.top = xresources['*color4']
c.colors.completion.match.fg = xresources['*color2']
c.colors.completion.scrollbar.bg = xresources['*color7']
c.colors.completion.scrollbar.fg = xresources['*color0']
c.colors.downloads.bar.bg = xresources['*color0']
c.colors.downloads.error.bg = xresources['*color7']
c.colors.downloads.error.fg = xresources['*color1']
c.colors.downloads.start.bg = xresources['*color7']
c.colors.downloads.start.fg = xresources['*color5']
c.colors.downloads.stop.bg = xresources['*color7']
c.colors.downloads.stop.fg = xresources['*color2']
c.colors.hints.fg = xresources['*color7']
c.colors.hints.bg = xresources['*color0']
c.colors.hints.match.fg = xresources['*color3']
c.colors.keyhint.fg = xresources['*color7']
c.colors.keyhint.bg = xresources['*color0']
c.colors.keyhint.suffix.fg = xresources['*color3']
c.colors.messages.error.fg = xresources['*color7']
c.colors.messages.error.bg = xresources['*color1']
c.colors.messages.error.border = xresources['*color1']
c.colors.messages.info.fg = xresources['*color7']
c.colors.messages.info.bg = xresources['*color2']
c.colors.messages.info.border = xresources['*color2']
c.colors.messages.warning.fg = xresources['*color7']
c.colors.messages.warning.bg = xresources['*color2']
c.colors.messages.warning.border = xresources['*color2']
c.colors.prompts.fg = xresources['*color7']
c.colors.prompts.bg = xresources['*color0']
c.colors.prompts.border = xresources['*color0']
c.colors.prompts.selected.bg = xresources['*color3']
c.colors.webpage.bg = xresources['*color7']
c.hints.border = '1px solid' + xresources['*color7']
