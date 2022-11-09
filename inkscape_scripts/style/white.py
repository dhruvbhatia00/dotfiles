for obj in selected_shapes():
    if 'fill' in obj.style() and obj.style()['fill'] == '#ffffff':
        obj.style(fill='none')
    else:
        obj.style(fill='#ffffff')
