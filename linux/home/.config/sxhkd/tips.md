Circulate windows ()
```zsh
bspc node @/ -C {backward,forward}
```

Rotate layout
```zsh
bspc node @/ -R {+,-}{90,180,270}
```

Flip layout (as shown in windelicato GIF)
```zsh
bspc node @/ -F {horizontal,vertical}
```

NOTE: `@/` is the root node of the current desktop
