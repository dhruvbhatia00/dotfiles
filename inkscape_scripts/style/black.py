for obj in selected_shapes():
    if 'fill' in obj.style() and obj.style()['fill'] == '#000000':
        obj.style(fill='none')
    else:
        obj.style(fill='#000000')
