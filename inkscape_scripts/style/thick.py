for obj in selected_shapes():
    if 'stroke_width' in obj.style() and obj.style()['stroke_width'] == 2.5:
        obj.style(stroke_width=1.25)
    else:
        obj.style(stroke_width=2.5)
        
