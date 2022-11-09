arrowhead = path([Move(0, 0),
                  Line(-8, 4),
                  Line(0, 8),
                  Curve(0, 8, -2, 6, -2, 4),
                  Curve(-2, 2, 0, 0, 0, 0),
                  ZoneClose()],
                 fill=None, stroke=None)
arrowhead = marker(arrowhead, (-2,4))

for obj in selected_shapes():
    if 'marker_start' in obj.style() and obj.style()['marker_start'] != 'none':
        obj.style(marker_start = 'none')
    else:
        obj.style(marker_start = arrowhead)
